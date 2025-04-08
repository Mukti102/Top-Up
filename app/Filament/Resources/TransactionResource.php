<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TransactionResource\Pages;
use App\Filament\Resources\TransactionResource\RelationManagers;
use App\Jobs\SendWa;
use App\Models\Transaction;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Tables\Filters\TabsFilter;
use Filament\Resources\Resource;
use Filament\Support\View\Components\Modal;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Enums\FiltersLayout;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Arr;

class TransactionResource extends Resource
{
    protected static ?string $model = Transaction::class;

    protected static ?string $navigationIcon = 'heroicon-o-banknotes';
    protected static ?string $navigationLabel = 'Transaksi';

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('user')
                    ->searchable()
                    ->relationship("user", 'name'),
                Forms\Components\Select::make('product')
                    ->searchable()
                    ->relationship('product', 'name')
                    ->required(),
                Forms\Components\TextInput::make('costumer_number')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('quantity')
                    ->required()
                    ->label("jumlah")
                    ->numeric(),
                Forms\Components\TextInput::make('price')
                    ->label("harga")
                    ->required()
                    ->numeric()
                    ->prefix('$'),
                Forms\Components\TextInput::make('reference_number')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Textarea::make('response')
                    ->columnSpanFull()
                    ->rows(20)
                    ->formatStateUsing(fn($state) => json_encode(json_decode($state, true), JSON_PRETTY_PRINT)),

                Forms\Components\TextInput::make('email')
                    ->email()
                    ->maxLength(255),
                Forms\Components\TextInput::make('phone')
                    ->tel()
                    ->maxLength(255),
                Forms\Components\Select::make('paymentMethod')
                    ->label('Methode Pembayaran')
                    ->relationship('paymentMethod', "name")
                    ->required(),
                Forms\Components\Select::make('status')
                    ->options([
                        "pending" => "Pending",
                        "processing" => "DiProses",
                        "success" => "Selesai",
                        "failed" => "Gagal"
                    ])
                    ->required(),
                Forms\Components\Select::make('status_payment')
                    ->options([
                        "pending" => "Pending",
                        "failed" => "Gagal",
                        "success" => "Berhasil",
                        "expired" => "kadaluarsa"
                    ])
                    ->required(),
                Forms\Components\DateTimePicker::make('processed_at'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('reference_number')
                    ->label('KODE')
                    ->searchable(),
                Tables\Columns\TextColumn::make("type")
                    ->searchable()
                    ->badge()
                    ->formatStateUsing(fn(string $state) => $state === "deposit" ? "Deposit" : "Purchase")
                    ->color(fn(string $state) => $state == "deposit" ? "info" : "warning"),
                Tables\Columns\TextColumn::make('product.name')
                    ->numeric()
                    ->label('Produk')
                    ->sortable(),
                Tables\Columns\TextColumn::make('status')
                    ->formatStateUsing(fn($state) => ucfirst($state))
                    ->badge()
                    ->searchable()
                    ->color(fn(string $state): string => match (strtolower($state)) {
                        'pending' => 'warning',
                        'processing' => 'primary',
                        'success' => 'success',
                        'failed' => 'danger',
                    }),
                Tables\Columns\TextColumn::make('status_payment')
                    ->label('Status Pembayaran')
                    ->formatStateUsing(fn($state) => ucfirst($state))
                    ->badge()
                    ->color(fn(string $state): string => match (strtolower($state)) {
                        'pending' => 'warning',
                        'success' => 'success',
                        'failed' => 'danger',
                        "expired" => "kadaluarsa"
                    }),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Waktu Pesanan')
                    ->sortable()
                    ->searchable()
                    ->formatStateUsing(fn($state) => Carbon::parse($state)->translatedFormat('d F Y H:i')),
                Tables\Columns\TextColumn::make('quantity')
                    ->numeric()
                    ->label('Jumlah')
                    ->sortable(),
                Tables\Columns\TextColumn::make('price')
                    // rupiah   
                    ->label('Total Harga')
                    ->sortable()
                    ->formatStateUsing(fn($state) => 'Rp ' . number_format($state, 0, ',', '.')),
                Tables\Columns\TextColumn::make('email')
                    ->icon('heroicon-m-envelope')
                    ->searchable(),
                Tables\Columns\TextColumn::make('phone')
                    ->label('Nomor Telepon')
                    ->icon('heroicon-m-phone')
                    ->searchable(),
                Tables\Columns\TextColumn::make('paymentMethod.name')
                    ->numeric()
                    ->badge()
                    ->color(fn() => Arr::random(['primary', 'success', 'warning', 'info', 'danger',])) //random color
                    ->label('Metode Pembayaran')
                    ->sortable(),

                Tables\Columns\TextColumn::make('processed_at')
                    ->label('Tanggal Pembayaran')
                    ->formatStateUsing(fn($state) => $state ? Carbon::parse($state)->translatedFormat('d F Y H:i') : 'Belum Dibayar')
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->label('Tanggal Diupdate')
                    ->sortable()
            ])
            ->filters([])
            ->actions([
                ActionGroup::make([
                    EditAction::make(),
                    DeleteAction::make(),
                    // kirim pesan wa   && munculkan modal textarea
                    Action::make('kirim_pesan_wa')
                        ->icon('heroicon-m-chat-bubble-left-right')
                        ->color('success')
                        ->form([
                            Textarea::make('message')
                                ->label('Pesan')
                        ])->action(function (Form $form, $record) {
                            $message = $form->getState()['message'];
                            $phone = $record->phone;
                            SendWa::dispatch($phone, $message);
                            // Notify user about the message sent
                            Notification::make()
                                ->success()
                                ->title('WhatsApp Message Sent!')
                                ->body('Message: ' . $message)
                                ->send();
                        }),
                    Action::make("Terima & Selesai")
                        ->icon('heroicon-m-check-circle')
                        ->color('info')
                        ->visible(fn($record) => $record->status == 'processing' && $record->status_payment == 'success')
                        ->action(function ($record) {
                            $record->update([
                                'status' => 'success',
                                'status_payment' => 'success',
                                'processed_at' => Carbon::now(),
                            ]);

                            SendWa::dispatch($record->phone, '
                            Pesanan dengan kode invoices' . $record->reference_number . ' telah selesai.
                            Terima Kasih
                            ');

                            Notification::make()
                                ->success()
                                ->title('Transaksi Selesai')
                                ->body('Transaksi dengan kode ' . $record->reference_number . ' telah selesai.')
                                ->send();
                        })
                ])->icon('heroicon-o-ellipsis-vertical')->label(''),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListTransactions::route('/'),
            'create' => Pages\CreateTransaction::route('/create'),
            'edit' => Pages\EditTransaction::route('/{record}/edit'),
        ];
    }
}
