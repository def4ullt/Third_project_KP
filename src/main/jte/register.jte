<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Вхід</title>
    <link rel="stylesheet" href="/style/styles.css">
</head>
<body>

<header>
    <div class="logo">Реєстрація</div>
    <nav id="nav-menu">
        <a href="/workload">Навантаження</a>
    </nav>
</header>


<form id="registerForm">
    <label for="username">Логін</label>
    <input type="text" id="username" name="username" required>

    <label for="password">Пароль</label>
    <input type="password" name="password" required>

    <label for="password">Повторіть пароль</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required>

    <button type="submit">Зареєструватись</button>

    <a href="/login">Маєте акаунт?</a>
    <div id="message" style="color: red;"></div>
</form>

<script>
    document.getElementById('registerForm').addEventListener('submit', async function(event) {
        event.preventDefault();

        const formData = new FormData(this);
        const data = Object.fromEntries(formData.entries());

        // Додано: перевірка паролів
        if (data.password !== data.confirmPassword) {
            document.getElementById('message').innerText = 'Паролі не збігаються!';
            return;
        }

        // Видаляємо confirmPassword перед відправкою
        delete data.confirmPassword;

        const response = await fetch('/api/register', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(data)
        });

        const text = await response.text();
        if (response.ok) {
            window.location.href = '/login';
        } else {
            document.getElementById('message').innerText = text;
        }
    });
</script>



</body>
</html>

