<div>

    <div class="mt-1 bg-gray-50 h-8">
        Current age = {{ $age }}
    </div>

    <div>

        <form wire:submit.prevent="saveAge">
            <div class="col-span-3 sm:col-span-2">
                <div class="mt-1 flex rounded-md shadow-sm">
                     <span class="inline-flex items-center px-3 bg-gray-50 text-gray-500 text-sm">
                       Age
                     </span>
                    <input type="text" name="age" wire:model.defer="user.age" wire:change="markUnsaved" class="inline-block w-full text-sm border-none"/>
                    @error('user.age') <span class="error">{{ $message }}</span> @enderror
                </div>
            </div>

            <div class="col-span-3 sm:col-span-2">
                <div class="mt-1 flex rounded-md shadow-sm">
                     <span class="inline-flex items-center px-3 bg-gray-50 text-gray-500 text-sm">
                       Age
                     </span>
                    <input type="text" name="age" wire:model.defer="user.email" wire:change="markUnsaved" class="inline-block w-full text-sm border-none"/>
                    @error('user.email') <span class="error">{{ $message }}</span> @enderror
                </div>
            </div>

            <button class="mt-1 text-{{ $changeSaved ? 'green': 'yellow' }}-600 hover:text-{{ $changeSaved ? 'green': 'yellow' }}-900 w-full inline-block text-sm font-medium bg-green-300 p-4">
                <!-- Heroicon check-circle -->
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline-block" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>

                Save
            </button>
        </form>

    </div>

</div>
