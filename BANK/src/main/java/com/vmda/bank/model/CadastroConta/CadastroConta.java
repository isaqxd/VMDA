package com.vmda.bank.model.CadastroConta;

import com.vmda.bank.model.Abstract.Pessoa;

import java.util.Date;

public class CadastroConta extends Pessoa {

    private String numeroConta;
    private Date dataCriacao;
    private TipoConta tipoConta;
    public enum TipoConta {
        CORRENTE,
        POUPANCA,
        INVESTIMENTO
    }

    public void setTipoConta(TipoConta tipoConta) {
        this.tipoConta = tipoConta;
    }
    public TipoConta getTipoConta() {
        return tipoConta;
    }

    public CadastroConta() {}

    public String getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(String numeroConta) {
        this.numeroConta = numeroConta;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }
}
