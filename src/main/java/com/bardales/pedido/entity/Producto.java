package com.bardales.pedido.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Cache;

import javax.lang.model.element.Name;
import java.math.BigDecimal;

@Data
@Entity
@Table (name = "Producto")

public class Producto {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "NOMBRE")
    private String nombre;
    
    @Column(name = "CODIGO")
    private String codigo;
    @Column(name = "precio_unitario", precision = 8,scale = 2,nullable = false)
    private BigDecimal preciounitario;

}
