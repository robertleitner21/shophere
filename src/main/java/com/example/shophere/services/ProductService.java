package com.example.shophere.services;

import com.example.shophere.models.Image;
import com.example.shophere.models.Product;
import com.example.shophere.models.User;
import com.example.shophere.repositories.ProductRepository;
import com.example.shophere.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public List<Product> listProducts(String title) {
        if (title != null) return productRepository.findByTitleContaining(title);
        return productRepository.findAll();
    }

    public void saveProduct(Principal principal, Product product, MultipartFile file1, MultipartFile file2, MultipartFile file3,
                            MultipartFile file4, MultipartFile file5) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        Image image4;
        Image image5;

        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }
        if (file4.getSize() != 0) {
            image4 = toImageEntity(file4);
            product.addImageToProduct(image4);
        }
        if (file5.getSize() != 0) {
            image5 = toImageEntity(file5);
            product.addImageToProduct(image5);
        }

        log.info("Saving new product. Title: {}; Author email: {}", product.getTitle(), product.getUser().getEmail());
        Product productFromDB = productRepository.save(product);
        productFromDB.setPreviewImageId(productFromDB.getImages().get(0).getId());
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(User user, Long id) {
        Product product = productRepository.findById(id)
                .orElse(null);
        if (product != null) {
            if (product.getUser().getId().equals(user.getId())) {
                productRepository.delete(product);
                log.info("Product with id = {} was deleted", id);
            } else {
                log.error("User: {} haven't this product with id = {}", user.getEmail(), id);
            }
        } else {
            log.error("Product with id = {} is not found", id);
        }
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

//    public String stringMatcher(String title) {
//        try {
//            SessionFactory sessionFactory;
//            List<Product> products = new ArrayList<>();
//
////            String[] fullTitle = {"Iphone 8 Plus", "Xbox One", "Elfbar 600", "Nike Zoom Freak 3"};
////            String info = "The product is not found";
////            if (title != null) {
////                for (int i = 0; i < fullTitle.length-1; i++) {
////                    String item = fullTitle[i];
////                    System.out.println(item);
////                    for (int k = 0; k < item.length(); k++) {
////                        char chr = item.charAt(k);
////                        for (int j = 0; j < charSearch.length; j++) {
////                            if (charSearch[j] == chr) return item;
////                        }
////                    }
////                }
////            }
//        } catch (Exception e) {
//            System.out.println("Title is null");
//        }
//        return null;
//    }
}
