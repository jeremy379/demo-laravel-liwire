<?php

namespace App\View\Components;

use Illuminate\View\Component;

class MyFirstComponenet extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct(protected int $age)
    {

    }

	public function calculateMyAgeInSeconds()
	{
		return $this->age * 365 * 86400;
	}

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.my-first-componenet', ['age' => $this->age]);
    }
}
