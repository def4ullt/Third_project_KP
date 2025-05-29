insert into logindata(id, username, password, role) values
    (1, 'admin', 'admin', 'ADMIN'),
    (2, 1111, 1111, 'STUDENT'),
    (3, 'boba', 'loba', 'PERSONAL')
ON CONFLICT DO NOTHING;