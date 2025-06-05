package org.sta6.dev.third_project_kp.Service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.sta6.dev.third_project_kp.Entity.logindata;
import org.sta6.dev.third_project_kp.Repository.loginDataRepository;

@Service
@RequiredArgsConstructor
public class loginDataDetailsService implements UserDetailsService {

    private final loginDataRepository loginDataRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        logindata user = loginDataRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Користувача не знайдено: " + username));

        return User.builder()
                .username(user.getUsername())
                .password(user.getPassword())
                .roles(user.getRole())
                .build();
    }
}
