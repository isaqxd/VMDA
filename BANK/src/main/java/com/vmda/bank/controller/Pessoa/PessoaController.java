package com.vmda.bank.controller.Pessoa;

import com.vmda.bank.model.Pessoa.Pessoa;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PessoaController {

    @GetMapping("/")
    public String mostrarFormulario(Model model) {
        model.addAttribute("pessoa", new Pessoa());
        return "form";
    }

    @PostMapping("/salvar")
    public String salvarPessoa(@ModelAttribute Pessoa pessoa, Model model) {
        try {

            System.out.println("Nome recebido: " + pessoa.getNome());
            System.out.println("Email recebido: " + pessoa.getEmail());
            System.out.println("CPF recebido: " + pessoa.getCpf());

            model.addAttribute("Pessoa", pessoa);
            return "resultado";
        } catch (IllegalArgumentException e) {
            model.addAttribute("erro", e.getMessage());
            return "form";
        }
    }
}