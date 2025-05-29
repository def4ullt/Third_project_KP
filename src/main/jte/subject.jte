@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.Subject
@param List<Subject> subjects


<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Таблиця предметів</title>
    <link rel="stylesheet" href="/style/styles.css">
</head>
<body>

<header>
    <a class="logo" href="/">Головне меню</a>
    <nav id="nav-menu">
        <a href="/workload">Навантаження</a>
        <a href="/teacher">Викладачі</a>
        <a>Ввійти</a>
    </nav>
</header>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Назва предмету</th>
        <th>Кількість годин</th>
        <th>Дії</th>
    </tr>

    </thead>
    <tbody>
    @for(Subject subject : subjects)
        <tr>
            <td>${subject.getSubject_id()}</td>
            <td>${subject.getName()}</td>
            <td>${subject.getHours()}</td>
            <td></td>
        </tr>
    @endfor
    </tbody>
</table>

</body>
</html>