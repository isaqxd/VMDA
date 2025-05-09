package Entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class User {
    private int codigo;
    private String nome;
    private String cpf;
    private LocalDate dataNascimento;
    private String telefone;
    private int tipoUsuario;
    private String senhaHash;
    private String otpAtivo;
    private LocalDateTime otpExpire;


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public int getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getSenhaHash() {
        return senhaHash;
    }

    public void setSenhaHash(String senhaHash) {
        this.senhaHash = senhaHash;
    }

    public String getOtpAtivo() {
        return otpAtivo;
    }

    public void setOtpAtivo(String otpAtivo) {
        this.otpAtivo = otpAtivo;
    }

    public LocalDateTime getOtpExpire() {
        return otpExpire;
    }

    public void setOtpExpire(LocalDateTime otpExpire) {
        this.otpExpire = otpExpire;
    }
}