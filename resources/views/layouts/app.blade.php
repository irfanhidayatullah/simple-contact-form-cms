<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CMS Simple Contact Form</title>
    
    <script src="https://cdn.tailwindcss.com"></script>
    
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    @include('partials.navbar')

    <main class="flex-1 container mx-auto p-4">
        @yield('content')
    </main>

    @include('partials.footer')

</body>
</html>