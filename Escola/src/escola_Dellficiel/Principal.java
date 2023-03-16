package escola_Dellficiel;

import javax.swing.JOptionPane; 

public class Principal{
    public static void main(String[] args)  {
        String aprovado;
        Aluno estudante = new Aluno();

        estudante.setNome(JOptionPane.showInputDialog("Informe o nome do estudante:"));
        estudante.setMatricula(Integer.parseInt(JOptionPane.showInputDialog("Informe o numero de matricula do estudante:")));
        estudante.setNotaProva(Double.parseDouble(JOptionPane.showInputDialog("Informe a nota da prova do estudante:")));
        estudante.setNotaProva2(Double.parseDouble(JOptionPane.showInputDialog("Informe a nota da segunda prova do estudante:")));
        estudante.setNotaTrabalho(Double.parseDouble(JOptionPane.showInputDialog("Informe a nota do trabalho do estudante:")));
        
        if(estudante.aprovacao() == true){
            aprovado = "Aprovado";
        }else{
            aprovado = "Reprovado";
        }
        JOptionPane.showMessageDialog(null,"Estudante: "+estudante.getNome()+" Matricula: "+estudante.getMatricula()+"\nMédia: "+estudante.media()+"\nSituação: "+aprovado+".");
    }
}