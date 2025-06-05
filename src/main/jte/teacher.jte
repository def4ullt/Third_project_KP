@import java.util.List
@import org.sta6.dev.third_project_kp.Entity.Teacher
@param List<Teacher> teachers
@param String username
@param Boolean isAdmin

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Таблиця викладачів</title>
    <link rel="stylesheet" href="/style/styles.css">
</head>
<body>




<header>
    <div class="logo">Головне меню</div>
    <nav id="nav-menu">
        @if(username != null)
            <span>Ви увійшли як <strong>${username}</strong></span>
        @endif
        @if(isAdmin)
            <a href="/adminPanel">Панель даних для входу</a>
        @endif
        @if(username != null)
            <a href="/workload">Навантаження</a>
            <a href="/subject">Предмети</a>
            <a href="/logout">Вийти</a>
        @else
            <a href ="/login">Ввійти</a>
        @endif
    </nav>
</header>

<div style="width: 90%; margin: 20px auto; display: flex; justify-content: flex-end;">
    <button href="/create" class="create-btn">Створити</button>
</div>


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
        <th>Ким створено:</th>>
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
            <td>${teacher.getOwner().getUsername()}</td>
            <td>
                @if(username == teacher.getOwner().getUsername() || isAdmin)
                    <button class="btn-edit" onclick="editItem(subject.getSubject_id())">Редагувати</button>
                    <button class="btn-del" onclick="deleteItem(subject.getSubject_id())">Видалити</button>
                @endif
            </td>
        </tr>
    @endfor
    </tbody>
</table>

</body>
</html>