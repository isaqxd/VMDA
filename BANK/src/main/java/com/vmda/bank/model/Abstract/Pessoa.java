package com.vmda.bank.model.Abstract;

import java.util.Date;

public abstract class Pessoa {
    private String nome;
    private String email;
    private String cpf;
    private String telefone;
    private String dataNascimento;


    public Pessoa() {
    }

    public Pessoa(String nome, String email, String cpf, String telefone, String dataNascimento) {
        this.nome = nome;
        this.email = email;
        this.cpf = cpf;
        this.telefone = telefone;
        this.dataNascimento = dataNascimento;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
            this.cpf = cpf;
    }

    public String getTelefone(){
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getDataNascimento(){
        return dataNascimento;
    }

    public void setDataNascimento (String DataNascimento){
        this.dataNascimento = DataNascimento;
    }
}