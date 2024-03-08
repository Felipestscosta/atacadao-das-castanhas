<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vídeo</title>

    <style>
        @keyframes loop {
            0% { opacity: 0; }
            100% { opacity: 1; }
            }

            .videoloop {
            animation: loop 5s infinite;
        }

    </style>

</head>
<body>
    <div>
        <video controls src="video.mp4" type="video/mp4 controls"  height="auto" width="100%" autoplay loop muted playsinline id="vid">  
        </video>
    </div>

    <script>
        document.getElementById('vid').play();
    </script>
</body>
</html>