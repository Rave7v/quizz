
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var preguntaLbl: UILabel!
    @IBOutlet weak var verdaderoBoton: UIButton!
    @IBOutlet weak var falsoBoton: UIButton!
    @IBOutlet weak var barraProgreso: UIProgressView!
    
    var numPregunta = 0;
    var correctas = 0;
    let preguntas = [
        Pregunta(texto: "Diez mas diez es 20", respuesta: "VERDADERO"),
        Pregunta(texto: "El ITM es la mejor escuela", respuesta: "VERDADERO"),
        Pregunta(texto: "el america es el mejor equipo de mexico", respuesta: "FALSO")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cambiarPregunta()
    }
    
    @IBAction func respuestaBtn(_ sender: UIButton) {
            let respuestaUsuario = sender.currentTitle//boton presionado
            let respuestaCorrecta = preguntas[numPregunta].respuesta
        
            if respuestaUsuario == respuestaCorrecta{
                print("respuesta correcta")
                sender.backgroundColor = UIColor.green
                correctas += 1
            }else{
                print("respuesta incorrecta")
                sender.backgroundColor = UIColor.red
            }
            //cambiar de pregunta
        if numPregunta + 1 < preguntas.count{
            cambiarPregunta()
            numPregunta += 1
        }else{
            //se terminaron las preguntas
            barraProgreso.progress = 0
            numPregunta=0
        }
        Timer.scheduledTimer(timeInterval: 0.8, target: self,selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
    }
    
    @objc func cambiarPregunta() {
        preguntaLbl.text = preguntas[numPregunta].texto
        verdaderoBoton.backgroundColor = UIColor.gray
        falsoBoton.backgroundColor = UIColor.gray
        barraProgreso.progress = Float((numPregunta + 1) / preguntas.count)
    }
}

