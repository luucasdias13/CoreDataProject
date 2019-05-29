//
//  ViewController.swift
//  Core Data Aula
//
//  Created by Lucas Dias on 28/05/19.
//  Copyright © 2019 lucasdias13. All rights reserved.
//

import UIKit
import CoreData

class CoreDataFunc {
    
    func requisicaoAll(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        /* criar uma requisicao */
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        
        
        do {
            let usuarios = try context.fetch(requisicao)
            
            if usuarios.count > 0{
                for usuario in usuarios as! [NSManagedObject] {
                    if  let nomeUsuario = usuario.value(forKey: "nome"){
                        if let idadeUsuario = usuario.value(forKey: "idade"){
                            if let loginUsuario = usuario.value(forKey: "login"){
                                if let senhaUsuario = usuario.value(forKey: "senha"){
                                    
                                    print(String(describing: nomeUsuario) + " / " + String(describing: idadeUsuario) + " | " + String(describing: loginUsuario) + " / " + String(describing: senhaUsuario))
                                }
                            }
                        }
                    }
                }
            }else{
            print("Nenhum usuario encontrado!")
            }
            print("Dados recuperados com sucesso")
        } catch {
            print("Erro ao recuperar os usuarios!")
        }
    }
        
    func salvar(nome : String, idade : Int16, login: String, senha: String){
        /*criar entidade */
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
         
         /* configure objeto */
         usuario.setValue(nome,  forKey: "nome" )
         usuario.setValue(idade, forKey: "idade")
         usuario.setValue(login, forKey: "login")
         usuario.setValue(senha, forKey: "senha")
         
         //Salvar (persistir os dados)
         do {
         try context.save()
         print("Dados cadastrados com sucesso!")
         } catch  {
         print("Erro ao salvar dados")
         }
        
    }
    
    
    
    }




