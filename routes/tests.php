<?php

use App\Http\Controllers\Test\TestController;

Route::get('/test', [TestController::class, 'index']);