<?php

namespace App\Filament\Resources;

use App\Filament\Resources\WhatsappTemplateResource\Pages;
use App\Filament\Resources\WhatsappTemplateResource\RelationManagers;
use App\Models\WhatsappTemplate;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\HtmlString;
use League\CommonMark\Extension\CommonMark\Node\Block\ListItem;

class WhatsappTemplateResource extends Resource
{
    protected static ?string $model = WhatsappTemplate::class;
    protected static ?string $label = "Template Pesan Whatsapp";

    protected static ?string $navigationIcon = 'heroicon-o-chat-bubble-left-right';
    protected static ?string $navigationGroup = 'Pengaturan';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Textarea::make('message')
                    ->required()
                    ->cols(20)
                    ->rows(10)
                    ->columnSpanFull()
                    ->helperText(function ($record) {
                        if (!$record || empty($record->parameters)) {
                            return new HtmlString("<pre>No parameters available.</pre>");
                        }

                        $parameters = json_decode($record->parameters, true); // Decode JSON ke array

                        if (empty($parameters)) {
                            return new HtmlString("<pre>No parameters available.</pre>");
                        }

                        // Looping parameter
                        $output = "<pre>";
                        foreach ($parameters as $key => $value) {
                            $output .= "<strong>{$key}:</strong> {$value} <br>";
                        }
                        $output .= "</pre>";

                        return new HtmlString($output);
                    }),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('role.name')
                    ->numeric()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    // Tables\Actions\DeleteBulkAction::make(),
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
            'index' => Pages\ListWhatsappTemplates::route('/'),
            'edit' => Pages\EditWhatsappTemplate::route('/{record}/edit'),
        ];
    }
}
