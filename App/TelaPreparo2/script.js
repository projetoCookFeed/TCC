var db = openDatabase("DataBase", "1.0", "TestDataBase", 200000); // Aqui o banco de dados é iniciado. Se a tabela TestTable não existe, ela é criada automaticamente
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS TestTable (id PRIMARY KEY, data)');
        });

const draggableElements = document.querySelectorAll(".draggable");
const droppableElements = document.querySelectorAll(".droppable");
let correto = 0;

draggableElements.forEach(elem => {
  elem.addEventListener("dragstart", dragStart);  // Dispara assim que o usuário começa a arrastar o item - Aqui que os valores do drag são definidos
});

droppableElements.forEach(elem => {
  elem.addEventListener("dragenter", dragEnter); // Dispara quando um item arrastável é levado a um elemento válido
  elem.addEventListener("dragover", dragOver); // Dispara quando um item arrastável é levado a um elemento válido, é repetido enquanto o item está dentro da área arrastável
  elem.addEventListener("dragleave", dragLeave); // Dispara quando um item arrastável deixa um elemento válido
  elem.addEventListener("drop", drop); // Dispara quando um item arrastável é levado a um alvo válido
});

// Funções do drag-and-drop

// Evento dispara no alvo arrastável

function dragStart(event) {
  event.dataTransfer.setData("text", event.target.id); 
}

// Evento dispara no alvo arrastável

function dragEnter(event) {
  if(!event.target.classList.contains("dropped")) {
    event.target.classList.add("droppable-hover");
  }
}

function dragOver(event) {
  if(!event.target.classList.contains("dropped")) {
    event.preventDefault(); // Previne o valor default para permitir arrastar
  }
}

function dragLeave(event) {
  if(!event.target.classList.contains("dropped")) {
    event.target.classList.remove("droppable-hover");
  }
}

function drop(event) {
  event.preventDefault(); // Isso é usado para impedir o método padrão do browser para lidar com os valores
  event.target.classList.remove("droppable-hover");
  const draggableElementData = event.dataTransfer.getData("text"); // Recebe os valores do drag. Este método vai retornar qualquer dado que foi foi definido com o mesmo tipo que no método setData()
  const droppableElementData = event.target.getAttribute("data-draggable-id");
  const isCorrectMatching = draggableElementData === droppableElementData;
  if(isCorrectMatching) { // Este método verifica se os itens arrastáveis foram arrastados para os elementos certos 
    const draggableElement = document.getElementById(draggableElementData);
    event.target.classList.add("dropped");
    event.target.style.backgroundColor = window.getComputedStyle(draggableElement).color;
    draggableElement.classList.add("dragged");
    draggableElement.setAttribute("draggable", "false");
    event.target.insertAdjacentHTML("afterbegin", `<img src="IMAGENS/${draggableElementData}.png" class="draggable"></img>`);
    console.log(correto);
    correto = correto + 1;
  }
  if (correto === 2){
    alerta();

      var nome = 'picole';
      var estado = 'Concluido';

      db.transaction(function(tx){ // Aqui o sistema atribui os valores do nome e estado aos atributos id e data da tabela TestTable e salva os dados
          tx.executeSql('INSERT INTO TestTable (id, data) VALUES(?, ?)', [nome, estado]);
      })

  window.location = '../TelaInicial/index.html';
  }
}

function alerta(){
  alert("Receita concluida com sucesso!");
}


