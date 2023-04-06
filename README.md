# Todo 
-  Pequena aplicação em Swftui ,usuário escolhe sua atividade, coloca uma descrição e a data, por fim pode consultar no calendário os eventos para o dia selecionado

# Feature
- Reforcei o conceito de UIViewRepresentable , ideia e converter componentes em UIKit pra Swiftui
- Quando o componente precisa do uso de delegate ou datasource usamos o makeCoordinator
- Quando você tem uma propriedade que depende de outra para ser definida, ideal e criar propriedade computadas,
- [Link](https://www.avanderlee.com/swift/computed-property/#:~:text=Computed%20properties%20are%20part%20of,computes%20its%20property%20upon%20request) para consulta sobre as propriedades computadas
- Repara que endDtae e uma propiredade computada, porque preciso que statDate esteja instanciado
- Dentro da classe coordinator tenho acesso a todos métodos do delegate e datasource

```swift
struct CalendarRepresentable: UIViewRepresentable {
	@Binding var selectedDate: Date
 
	var calendar = FSCalendar()
	
	//quando preciso de usar contexto ou self preciso criar um coordinator
	func makeUIView(context: Context) -> FSCalendar {
		calendar.delegate = context.coordinator
		calendar.dataSource = context.coordinator
		calendar.appearance.todayColor = UIColor(ColorsApp.secondaryColor) // Cannot assign value of type 'Color' to type 'UIColor'
		calendar.appearance.titleFont = UIFont(name: "Inter-Regular", size: 17)
		calendar.appearance.headerTitleFont = UIFont(name: "Inter-Bold", size: 19)
		calendar.appearance.caseOptions = [.headerUsesCapitalized]
		calendar.locale = Locale(identifier: "en-us")
		return calendar
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
	   
	}
		
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
 

	class Coordinator: NSObject,FSCalendarDelegate,FSCalendarDataSource {
		let  startDate = Calendar.current.startOfDay(for: Date())
	
		var  endDate: Date  {
			Calendar.current.date(byAdding: DateComponents(year: 1), to: startDate)?.addingTimeInterval(-1) ?? Date()
		}
		var parent: CalendarRepresentable
		
		init(_ parent: CalendarRepresentable) {
			self.parent = parent
		}
		 
	 
		
		//aqui vou ter o acesso ao metodos disponivel no calendar delegate e data source
		
		func minimumDate(for calendar: FSCalendar) -> Date {
			  return startDate
		}
		
		func maximumDate(for calendar: FSCalendar) -> Date {
			 return endDate
		}
		
		//metodo quando e acionado uma data
		func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
			//parent vou possuir acesso a todas as variaveis dessa classe
			//repare que tem um bind la em cima escrito selectedDate
			print(date)
			parent.selectedDate = date
		}
	
	
		
	}
		
}



```
## 
 
- Para navegar a proxima tela podemos usar o método tradicional ou navigationDestination
- Repara que no método onAppear retorno o estado do goWhenTrue com valor inicial, se não quando voltar na tela não consigo navegar
- Para acrescentar um novo button para voltar podemos usar o método toolbar
- Outra vantagem da propriedade computada e poder de reagir a mudanças como exemplo do selectedDate

```swift



.navigationDestination(isPresented: $goWhenTrue) {
								
			ActivitiesDetails(categoryActivies: $activitiesSelected)
								
}



.navigationBarBackButtonHidden(true)
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button(action: handleBack) {
					Image(systemName: "chevron.left")
						.foregroundColor(ColorsApp.secondaryColor)
				}
			}
		}
		
	}
  
  
var actives: [ActivitiesModel] {
		return activitiesModel.filter { activy in
			selectedDate.compare(toDate: activy.date, granularity: .day)  == .orderedSame
		}
	}
  
  

```
- 

## 
- Para fazer um TextField [dinâmico](https://sarunw.com/posts/swiftui-multiline-textfield/) na altura


```swift
TextField(text: $textField,axis: .vertical) {
	Text("Your description,it's optional")
}


```



