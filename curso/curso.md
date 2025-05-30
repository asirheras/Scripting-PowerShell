# 📘 Curso Completo de PowerShell – De Principiante a Avanzado


* * *

## 🧰 Requisitos Previos

---------------------

*   Windows 10/11 con PowerShell 5.1 o superior (mejor aún: instalar **PowerShell 7** desde [https://github.com/PowerShell/PowerShell](https://github.com/PowerShell/PowerShell))
    
*   Editor recomendado: Visual Studio Code con extensión **PowerShell**
    
*   Conocimientos básicos de sistemas operativos Windows (terminal, carpetas, procesos)
    

* * *

## Índice

1. [Introducción a PowerShell][def]

2. [Comandos Básicos y Navegación](#2)
   
3. [Variables, Tipos y Operadores](#3)

4. [Condicionales y Bucles](#4)

5. [Funciones y Módulos](#5)

6. [Trabajando con Archivos y Carpetas](#6)

7. [Automatización y Tareas Programadas](#7)

8. [Objetos y el Pipeline](#8)

9.  [Administración de Sistema con PowerShell](#9)

10. [PowerShell Remoto y Seguridad](#10)

11. [PowerShell Avanzado: .NET, APIs y Scripts Profesionales](#11)

* * *

<a name="1"></a>

### 1\. 🧭 Introducción a PowerShell


> **Objetivo**: Comprender qué es PowerShell y cómo usarlo.

### 📚 Conceptos Clave

* Shell vs PowerShell
  
* CMDLETs (`Get-Command`, `Get-Help`, `Get-Alias`)

* Diferencias entre PowerShell 5.1 y PowerShell 7+

### 1.1. Shell, CMD, Powershell ... ¿que son?

Una shell es una interfaz que te permite comunicarte con el sistema operativo escribiendo **comandos** (ordenes), es decir, es  como una especie de traductor entre tú y el núcleo del sistema operativo (SO). En Windows, encontramos dos tipos de shell:

* **CMD (cmd.exe) ó Símbolo de sistema**: Fue la shell por defecto durante décadas. Se caracteriza por estar muy limitada, porque solo maneja texto, no soporta programación real ni integración con otras herramientas moderna, y además, no puede transformar la información facilmente.

* **Powershell**: Evolución del CMD. Es una shell, pero además es un lenguaje de scripting muy potente, porque trabaja con objetos, y no solo texto. Además, soporta programación real ( funciones, bucles, condicionales, etc...) y se puede usar para automatizar tareas administrativas como gestionar servidores, redes, Active Directory, cloud, etc.
  

| Shell          | Sistema         | Características principales                   |
| -------------- | --------------- | --------------------------------------------- |
| **CMD**        | Windows         | Muy básico, comandos simples                  |
| **PowerShell** | Windows / cross | Basado en objetos, muy potente para admins    |
| **Bash**       | Linux / macOS   | Muy usado en servidores, scripting clásico    |
| **Zsh/Fish**   | Linux / macOS   | Alternativas modernas con más funcionalidades |

 1.2. ¿Qué son los CMDLETs?

Un Cmdlet (se pronuncia command-let) es un comando ligero de PowerShell, diseñado específicamente para tareas administrativas. Son `clases .NET` que ejecutan una única operación bien definida, y diferencia de comandos tradicionales (como en CMD o Bash), los cmdlets:

* Trabajan con objetos, no con texto plano.

* Se pueden encadenar (pipeline) para formar scripts potentes.

* Siguen la convención *Verbo-Sustantivo* (por ejemplo, Get-Process, Set-Date).

### 1.3. Kit de exploración de Powershell :`Get-Command`, `Get-Help`, `Get-Alias`

