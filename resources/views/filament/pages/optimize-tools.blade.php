<x-filament::page>
    <div class="space-x-4">
        <x-filament::button wire:click="clearCache" color="danger">
            🧹 Clear Cache
        </x-filament::button>

        <x-filament::button wire:click="optimizeApp" color="success">
            ⚡ Optimize App
        </x-filament::button>
    </div>
</x-filament::page>
