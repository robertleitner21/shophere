package com.example.shophere.services;

import com.example.shophere.enums.Role;
import com.example.shophere.models.User;
import com.example.shophere.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        log.info("Saving new user with email: {}", email);
        userRepository.save(user);
        return true;
    }
}
