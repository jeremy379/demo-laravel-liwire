<?php

namespace App\Http\Livewire;

use Livewire\Component;

class AgeChanged extends Component
{
	public bool $showOk = false;

	protected $listeners = ['ageUpdated'];

	public function ageUpdated(int $age)
	{
		$this->showOk = true;
	}

    public function render()
    {
        return view('livewire.age-changed');
    }
}
