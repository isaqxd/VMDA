package com.vmda.bank.controller.Cadastro;

import com.vmda.bank.model.CadastroConta.CadastroConta;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CadastroController {
    @GetMapping("/cadastrarCliente")
    public String mostrarFormulario(Model model) {
        model.addAttribute("criar", new CadastroConta());
        return "cadastrarCliente";
    }

    @PostMapping("/salvar")
    public String salvarPessoa(@ModelAttribute CadastroConta criar, Model model) {
        try {
            System.out.println("Nome recebido: " + criar.getNome());
            System.out.println("Email recebido: " + criar.getEmail());
            System.out.println("CPF recebido: " + criar.getCpf());
            System.out.println("Tipo de conta recebido: " + criar.getTipoConta());

            model.addAttribute("criar", criar);
            return "resultado";
        } catch (IllegalArgumentException e){
            model.addAttribute("erro", e.getMessage());
            return "cadastrarCliente";
        }
    }
}
