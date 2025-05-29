@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.Teacher
@param List<Teacher> teachers


<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Таблиця викладачів</title>
    <link rel="stylesheet" href="/style/styles.css">
</head>
<body>

<header>

    <a class="logo" href="/">Головне меню</a>

    <nav id="nav-menu">
        <a href="/workload">Навантаження</a>
        <a href="/subject">Предмети</a>
        <a>Ввійти</a>
    </nav>
</header>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Прізвище</th>
        <th>Ім'я</th>
        <th>По-батькові</th>
        <th>Академічний ступінь</th>
        <th>Посада</th>
        <th>Стаж</th>
        <th>Дії</th>
    </tr>

    </thead>
    <tbody>
    @for(Teacher teacher : teachers)
        <tr>
            <td>${teacher.getTeacher_Id()}</td>
            <td>${teacher.getLast_Name()}</td>
            <td>${teacher.getFirst_Name()}</td>
            <td>${teacher.getSecond_name()}</td>
            <td>${teacher.getAcademic_degree()}</td>
            <td>${teacher.getPosition()}</td>
            <td>${teacher.getExperience()}</td>
            <td></td>
        </tr>
    @endfor
    </tbody>
</table>

</body>
</html>