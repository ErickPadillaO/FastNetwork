CREATE TABLE planes(
  plan_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre_plan VARCHAR(50) NOT NULL,
  velocidad_mbps INT CHECK (velocidad_mbps >= 50),
  precio_mensual NUMERIC(6,2) CHECK (precio_mensual > 0)
);

CREATE TABLE clientes (
    cliente_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion_instalacion VARCHAR(150) NOT NULL,
    plan_id INT NOT NULL,
    estado_cliente VARCHAR(20) DEFAULT 'Pendiente',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_cliente_plan 
    FOREIGN KEY (plan_id) REFERENCES planes(plan_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
