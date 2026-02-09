package com.bardales.pedido.service;

import com.bardales.pedido.entity.Producto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface ProductoService {
    Page<Producto> findAll(Pageable pageable);
    Page<Producto> search(String texto, Pageable pageable);
    Producto findByID(Long id);
    Producto create(Producto producto);
    Producto update(Long id, Producto producto);
    void deleteById(Long id);

}
