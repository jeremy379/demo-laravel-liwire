<?php

namespace App\Http\Livewire;

use App\Models\User;
use Livewire\Component;

class MyLwcpt extends Component
{
	public int $age;
	public bool $changeSaved = false;
	public User $user;



	protected $rules = [
		'user.email' => 'required',
		'user.age' => 'required|int|max:99',
	];


	public function saveAge()
	{
		$this->validate();

		$this->age = $this->user->age;

		$this->emit('ageUpdated', $this->age);

		$this->changeSaved = true;
	}

	public function markUnsaved()
	{
		$this->changeSaved = false;
	}


	public function render()
    {
        return view('livewire.my-lwcpt');
    }
}
