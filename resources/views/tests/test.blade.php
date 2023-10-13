<!DOCTYPE html>
<html lang="en">
<html>
    <head>
        @vite('resources/css/app.css')
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>測試</title>
    </head>

    <body>
        <a type="submit" id="test" class="btn btn-primary btn-lg">test</a>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    @vite('resources/js/app.js')
</html>