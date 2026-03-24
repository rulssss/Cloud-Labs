# QUE HACE EL PROYECTO?

Este proyecto de Terraform crea una red base en AWS para un entorno `dev` en la region `sa-east-1`.

La infraestructura definida hace exactamente esto:

- Crea una VPC con el rango `10.0.0.0/16`.
- Crea 4 subnets dentro de esa VPC:
	- 2 publicas: `10.0.1.0/24` y `10.0.2.0/24`.
	- 2 privadas: `10.0.3.0/24` y `10.0.4.0/24`.
- Configura las subnets publicas con asignacion automatica de IP publica al lanzar instancias.
- Crea un Internet Gateway y lo asocia a la VPC.
- Crea una tabla de rutas publica con salida a internet (`0.0.0.0/0`) a traves del Internet Gateway.
- Asocia la tabla de rutas publica a las 2 subnets publicas.
- Crea una tabla de rutas privada y la asocia a las 2 subnets privadas.
- Crea un Security Group basico dentro de la VPC con estas reglas:
	- Permite ingreso por SSH en el puerto `22` desde cualquier IP.
	- Permite ingreso por HTTP en el puerto `80` desde cualquier IP.
	- Permite todo el trafico de salida.

Importante: las subnets privadas no tienen NAT Gateway ni salida directa a internet, porque la configuracion actual solo crea la ruta publica hacia el Internet Gateway.

# COMO EJECUTARLO:

# - terraform init
# - terraform fmt
# - terraform validate
# - terraform plan
# - terraform apply

# Al finalizar aplciar:

# - terraform destroy