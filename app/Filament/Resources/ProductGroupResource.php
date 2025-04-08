<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProductGroupResource\Pages;
use App\Filament\Resources\ProductGroupResource\RelationManagers;
use App\Models\ProductGroup;
use Filament\Forms;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProductGroupResource extends Resource
{
    protected static ?string $model = ProductGroup::class;

    protected static ?string $navigationIcon = 'heroicon-o-archive-box';
    protected static ?string $navigationGroup = 'Data Product';
    protected static ?string $navigationLabel = 'Group';


    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Group')
                    ->schema([
                        Grid::make([
                            'default' => 0,
                            'md' => 16,
                        ])->schema([
                            Forms\Components\TextInput::make('name')
                                ->required()

                                ->maxLength(255)
                                ->columnSpan(8),
                            Forms\Components\FileUpload::make('image')
                                ->image()
                                ->disk('public')
                                ->directory('product-group')
                                ->required()
                                ->columnSpan(8),

                        ]),
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\ImageColumn::make('image'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListProductGroups::route('/'),
            'create' => Pages\CreateProductGroup::route('/create'),
            'edit' => Pages\EditProductGroup::route('/{record}/edit'),
        ];
    }
}
