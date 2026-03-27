# 🌐 Terraform AWS Networking Lab (Dev & Prod)

Infraestructura base en AWS utilizando Terraform, con separación de entornos (**dev** y **prod**), estado remoto en S3 y despliegue automático mediante GitHub Actions.

---

## 📌 Objetivo

Este proyecto implementa una red base en AWS siguiendo buenas prácticas:

* Uso de **módulos reutilizables**
* Separación de entornos (`dev` y `prod`)
* Estado remoto con **S3 + DynamoDB (locking)**
* CI/CD con GitHub Actions
* Despliegue automático en `dev` y controlado en `prod`

---

## 🧱 Infraestructura creada

* VPC
* Subnets públicas y privadas
* Internet Gateway (IGW)
* Route Tables
* Security Groups

⚠️ No se utiliza NAT Gateway para evitar costos.

---

## 📁 Estructura del proyecto

```
aws-state-remote-and-environments/
├── environments/
│   ├── dev/
│   │   └── main.tf
│   └── prod/
│       ├── main.tf
│       └── variables.tf
├── modules/
│   ├── vpc/
│   ├── subnets/
│   ├── routing/
│   └── security-group/
├── bootstrap/
│   └── main.tf   # crea S3 + DynamoDB (backend)
└── .github/
    └── workflows/
        ├── terraform.yml       # DEV
        └── terraform-prod.yml  # PROD
```

---

## ⚙️ Backend (Estado remoto)

Terraform guarda el estado en:

* 🪣 S3 → almacenamiento del state
* 🔒 DynamoDB → locking (evita ejecuciones simultáneas)

### Inicialización del backend

```bash
cd bootstrap
terraform init
terraform apply
```

Esto crea:

* bucket S3
* tabla DynamoDB

---

## 🚀 Cómo desplegar

---

### 🟢 DEV (automático)

#### Qué lo dispara

* Cambios en:

  * `modules/`
  * `environments/dev/`

#### Flujo

```text
Commit → GitHub Actions → terraform apply (dev)
```

#### Características

* Automático
* Sin aprobación
* Entorno de prueba

---

### 🔴 PROD (controlado)

#### Qué lo dispara

* Cambios en:

```text
environments/prod/
```

#### Flujo

```text
Cambio intencional → Push → GitHub Actions → Approval → Apply
```

#### Características

* Requiere aprobación manual
* No se despliega automáticamente con cambios en módulos
* Representa entorno real

---

## 🧠 Cómo promover cambios a producción

1. Hacer cambios en `modules/`
2. Verificar en DEV (deploy automático)
3. Actualizar PROD con un cambio real, por ejemplo:

```hcl
release_version = "v2"
```

4. Hacer push
5. Aprobar el deploy en GitHub Actions

---

## 🔄 CI/CD (GitHub Actions)

### DEV Workflow

* Ejecuta:

  * `terraform init`
  * `terraform plan`
  * `terraform apply`

* Se activa con cambios en:

  ```
  modules/**
  environments/dev/**
  ```

---

### PROD Workflow

* Ejecuta:

  * `terraform init`
  * `terraform plan`
  * (espera aprobación)
  * `terraform apply`

* Se activa con cambios en:

  ```
  environments/prod/**
  ```

---

## ⚠️ Buenas prácticas implementadas

* ❌ No aplicar cambios en PROD desde local
* ✅ Uso de módulos reutilizables
* ✅ Separación de entornos por estado
* ✅ CI/CD para despliegues
* ✅ Control manual en producción

---

## 🧪 Destruir infraestructura

### DEV

```bash
cd environments/dev
terraform destroy
```

### PROD

```bash
cd environments/prod
terraform init -reconfigure
terraform destroy
```

---

## 💸 Costos

Este proyecto evita recursos costosos:

* ❌ NAT Gateway
* ❌ EC2

👉 Infraestructura prácticamente gratuita (solo networking)

---

## 🧠 Conceptos aplicados

* Infrastructure as Code (IaC)
* Terraform Modules
* Remote State
* Environment Separation
* CI/CD pipelines
* GitHub Actions
* Cloud Networking (AWS)

---

## 🚀 Resultado

* Infraestructura reproducible
* Separación clara entre dev y prod
* Flujo de despliegue similar a entornos reales de empresa

---

## 👤 Autor

Proyecto realizado como práctica de Terraform y AWS para nivel profesional.
