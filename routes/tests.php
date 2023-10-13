<?php

use App\Http\Controllers\Tools\TestController;

Route::get('/test', [TestController::class, 'index']);