# 🌐 AWS Terraform Networking Lab (Foundations + Best Practices)

Este repositorio representa la base de aprendizaje y evolución en **Infrastructure as Code (IaC)** utilizando Terraform sobre AWS.

El proyecto está dividido en dos etapas claras:

1. 🧱 **Infraestructura base (fundamentos)**
2. 🚀 **Infraestructura profesional (buenas prácticas)**

---

## 📌 Objetivo

Construir desde cero una red en AWS y evolucionarla hacia un diseño más cercano a entornos reales de trabajo, aplicando:

* Modularización
* Separación de entornos
* Estado remoto
* Automatización con CI/CD

---

## 🧱 Etapa 1 — Fundamentos de infraestructura

En esta fase se construyó una red básica en AWS para entender cómo funciona Terraform.

### 🔧 Qué se implementa

* VPC
* Subnets públicas y privadas
* Internet Gateway (IGW)
* Route Tables
* Security Groups

### 🎯 Objetivo

Aprender:

* Cómo Terraform crea recursos
* Dependencias entre componentes
* Estructura básica de archivos `.tf`

### ⚠️ Limitaciones

* Código monolítico (sin módulos)
* Sin separación de entornos
* Estado local
* Sin automatización

---

## 🚀 Etapa 2 — Infraestructura profesional

En esta fase el proyecto se refactoriza completamente aplicando buenas prácticas de la industria.

---

## 🧠 Conceptos aplicados

### 📦 Modularización

La infraestructura se divide en módulos reutilizables:

```text id="v2tqg8"
modules/
├── vpc/
├── subnets/
├── routing/
└── security-group/
```

---

### 🌍 Separación de entornos

```text id="f0z5h2"
environments/
├── dev/
└── prod/
```

* `dev` → pruebas y experimentación
* `prod` → entorno controlado

---

### 🗄️ Estado remoto

Terraform utiliza:

* **S3** → almacenamiento del state
* **DynamoDB** → locking

Esto permite:

* Trabajo en equipo
* Evitar corrupción del estado
* Control centralizado

---

### ⚙️ CI/CD con GitHub Actions

Se automatiza el despliegue:

#### 🟢 DEV

* Deploy automático
* Se ejecuta en cada cambio en módulos o dev

#### 🔴 PROD

* Deploy controlado
* Requiere aprobación manual
* No se actualiza automáticamente con cambios en módulos

---

## 🔁 Flujo de trabajo

```text id="s5ns9z"
1. Se realizan cambios en módulos
2. Se despliega automáticamente en DEV
3. Se validan los cambios
4. Se promueven a PROD mediante aprobación
```

---

## 📁 Estructura del proyecto

```text id="5p9fuy"
aws-state-remote-and-environments/
├── environments/
│   ├── dev/
│   └── prod/
├── modules/
├── bootstrap/        # backend (S3 + DynamoDB)
└── .github/workflows/
```

---

## 💸 Control de costos

Se evita el uso de recursos costosos como:

* ❌ NAT Gateway
* ❌ EC2

👉 Proyecto enfocado en networking (costo casi nulo)

---

## ⚠️ Buenas prácticas implementadas

* Uso de módulos reutilizables
* Separación de entornos
* Estado remoto
* Automatización CI/CD
* Deploy controlado en producción
* Evitar cambios manuales en producción

---

## 🧠 Aprendizajes clave

* Terraform no es solo crear infraestructura, sino gestionarla
* Separar entornos evita errores críticos
* El estado remoto es fundamental en proyectos reales
* CI/CD permite despliegues seguros y repetibles

---

## 🚀 Resultado

Se logra una infraestructura:

* Reproducible
* Escalable
* Segura
* Alineada con prácticas reales de la industria

---

## 👤 Autor

Proyecto realizado como parte del aprendizaje progresivo de Terraform y AWS, evolucionando desde fundamentos hasta prácticas profesionales.
