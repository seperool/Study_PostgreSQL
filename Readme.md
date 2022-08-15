# 1 Objetivo

Estudo dirigido de **PostgreSQL**.

# 2 Referência

Vídeo aulas “O curso completo de Banco de Dados e SQL, sem mistérios” -
Udemy.

# 3 Módulo 30 - Instalação do **PostgreSQL**, conectando servidor ao **pgAdmin 4** e acessando **psql**

## 3.1 Instação do **PostgreSQL**

### 3.1.1 Principais programas

-   **PostgreSQL**  
    É um sistema gerenciador de banco de dados objeto relacional (SGBD),
    desenvolvido como projeto de código aberto, que pode ser baixado
    pelo site:  
    <https://www.postgresql.org/download/>  

-   **pgAdmin 4**  
    É uma interface web com o banco de dados. Pode ser baixado pelo
    site:  
    <https://www.pgadmin.org/download/>  

-   **psql**  
    O psql é um front-end baseado em terminal para o PostgreSQL.  

-   **Sublime Text**  

    -   Sublime Text é um editor de código-fonte multi-plataforma.  
    -   Ele suporta nativamente muitas linguagens de programação e
        linguagens de marcação.  
    -   Serve para escrever os script’s “.sql”, antes de lançar no banco
        de dados.  

## 3.2 Conectando **pgAdmin 4** ao Servidor

-   Primeiro apois afazer as instalações, ao abrir o **pgAdmin 4**, o
    programa vai pedir para registrar uma senha para proteção do
    sistema.  

-   Antes de adicionar o novo servidor no **pgAdmin 4**, é necessário
    mudar a senha do PostgreSQL, acessando ele pelo terminal, pelo
    **psql**.  

    -   Assim se torna necessário abrir o terminal e acessar o psql:  
        sudo -u postgres psql  
        *senha_sudo*  
    -   Para mudar a senha do usuario postgres, basta digitar o
        comando:  
        **ALTER USER** postgres **PASSWORD** ‘*novo_password*’  

-   Após a mudança da senha, podemos registrar o novo servidor no
    **pgAdmin 4**.  

    -   Clickar com o botão esquerdo em “servers” \> “Register” \>
        “server”.  
    -   Na aba “General”, basta adicionar um nome para o server.  
        “*localhost*” \[nome mais comum\]  
    -   Na aba “Connection” é necessário preencher:  
        -   Hostname: “localhost”  
        -   Port: 5432  
        -   Maintenance database: postgres  
        -   Username: postgres  
        -   Password: \[repetir a senha cadastrada anteriormente no
            psql\]  
    -   Ao clicar em “Salvar” o novo servidor estará conectado.  

## 3.3 Acessando **PostgreSQL** pelo terminal - psql

-   Para acessar o **PostgreSQL** pelo terminal do **UBUNTU** o comando
    é:  
    sudo -u postgres psql  
    *senha_sudo*  

## 3.4 Alterando senha do usuario postgres

-   O comando para alterar usuário e senha no Postgres pelo terminal
    é:  
    **ALTER USER** postgres **PASSWORD** ‘*novo_password*’  

-   Este comando é útil para conectar o servidor a insterface
    *pgAdmin4*, pois necessita criar uma senhar para o usuário
    *postgres*.  

# 4 Observações

# 5 Andamento dos Estudos

## 5.1 Assunto em andamento

Atualmente estou estudando Módulo 30 - AULA 119.  
