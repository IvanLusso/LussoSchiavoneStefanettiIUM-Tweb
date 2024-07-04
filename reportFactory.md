## 1. Solution:
   > *Design and its motivations: explain how your solution works and explain why you chose to design your solution in this particular way. Does it have advantages/disadvantages over other design choices?*
   
   > [!idea] Answer
> ##### Servers Content Partitioning:
> We used a **cleaned dataset** for the website project
> We have divided data tables between MongoDB and PostgreSQL in base of 

Innanzitutto abbiamo pulito i dati in maniera tale da popolare i database in maniera più efficiente e meglio organizzata secondo i nostri criteri.
Quindi abbiamo deciso di mantenere il criterio della staticità / dinamicità dei dati per il loro inserimento in MongoDB piuttosto che in PostgreSQL. A ciò, abbiamo tuttavia applicato delle eccezioni che riguardano il basso grado di accoppiamento di determinate tabelle, quale ad esempio competitions.

Abbiamo deciso per questo progetto di pulire i dati prima di inserirli nei rispettivi database. Ciò è motivato dal fatto che ci ha reso più semplice, leggera e veloce la loro gestione.
Il nostro progetto è responsive, pertanto prevede un'interfaccia che si adatta all'uso sia desktop sia mobile. Tale implementazione ci ha richiesto di progettare una struttura degli elementi della pagina, tale da poter essere adattabile, ciò è stata una delle sfide iniziali più impegnative.



>

---

## 2. Issues:
>  *Introduce the task this section refers to and the challenges that you were faced with.*

> [!idea] Answer
> 

---
## 3. Requirements: 
> *How does this design comply with the requirements specified in the original assignment sheet? Are you meeting all requirements?*

> [!idea] Answer


---
## 4. Limitations: 
> *Have you thought about exceptional situations that may limit your solution? Is your solution extensible? Can it be easily adapted for other requirements? Remember that no design is flawless and that is ok!*

> [!idea] Answer
> 

---
## 5. Conclusions:
> *(no marks) - You should include here any relevant conclusions you've collectively arrived at regarding the process of designing the solution for this part of the assignment as well as any lessons learned.*

> [!idea] Answer


---
## 6. Division of Work:
> *(No marks – MANDATORY) – Have all the group members shared the workload in a balanced way? In what way? E.g. what has each member provided – be precise!*

> [!idea] Answer
> We handled trying to divide equally the work between us. Generally, the task were divided this way: 
> - *Lusso Ivan* $\rightarrow$ Focalized on **chat & socket** implementation, also working on **MongoDB** set up, **Second Express Server routes** implementation and **Data Analysis**.
> - *Schiavone Marco* $\rightarrow$ Sketched the website **interface**, focalizing on **GUI** implementation, HTML/CSS issues fixing (especially for carousels), **Data Analysis** study and **MongoDB routes** writing down.
> - *Stefanetti Matteo* $\rightarrow$ Drawn up the **PostgreSQL** server with its tables, drafting **SpringBoot Server routes** and working on **GUI** implementation too. 
> 
> That said, every team member has touched, at least in some small way, every aspect of the project. 
> Where a portion of code has been implemented by a single person *(e.g. chat system, custom carousels, JPA set up)*, communication and updates on the progress status among group members have never been lacking.

---
## 7. Extra Information
> *(No marks – MANDATORY) – This section should include any extra details needed to run your code. If no extra configuration is needed, please explicitly say so in this section.*

> [!idea] Answer
> **Scripts**
> We made 3 `.bat` and `.sh` files used to run the projects without having to deal with JetBrains RAM consumption. These **scripts** can be easily run via shell, if the current position is inside the *'/solution'* directory. 
> *E.g.* 
> - `C:\Users\ownPathToTheProject\solution>WinMainServer.bat`
> - `~/ownPathToTheProject/solution$ LinuxMainServer.sh`
> <br>
> 
> **Responsivity**
> The code is designed to be responsive, so the project can run in a window and adapt the interface to it. But it is not designed to run fine even on window resize (carousels can break up a bit)
> <br>
> 
> **Single-Page**
> We made a single page solution, where the chat is integrated in the page dynamically.
> - When in *"device mode"*, the website will use an offcanvas element to retrieve a collapsible chat.
> - When in *"desktop mode"* the website will reserve a **portion of the screen** for the chat, filling it with fake **ads** when the chat is collapsed.

---
##  8. Bibliography
> *(no marks) - Do not forget to cite any sources and reference these within the text where appropriate (e.g., “\[...\] we have used the techniques as per \[1\].”). Make sure to use a standard format style. No need to cite the lecture notes or lab classes.*

> [!idea] Answer
> We used many sources to help us understand the APIs and libraries used in the project. 
> Rather than a bibliography, we list below a **sitography** of the supporting material we have used.
> We made use of **official documentation** from:
> - ‘*socket.io*’ for implementing the **chat** ([docs](https://socket.io/docs) and [get-started](https://socket.io/get-started); see  `public/javascripts/chat.js` and `socket.io/socket.io.js` on *MainExpressServer*)
> - '*Bootstrap v5.3*' for the client’s graphics ([getbootstrap.com](https://getbootstrap.com/docs/5.3/getting-started/introduction/); used for *popover*, *tooltip*, *offcanvas*, *accordions* etc.)
> - '*MDN Mozilla JavaScript*' for client-side interactions ([MDN Mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript))
> - JPA, Express, and Mongoose for implementing the secondary servers
><br>
>
> Additionally, we used generative AI (such as *ChatGPT 4.0*, *Google Bard*, and *Gemini AI*), which were particularly helpful in studying **Python** syntax and its libraries for **Data Analysis**.
>
> We also mention the websites [w3Schools](https://www.w3schools.com) and [StackOverflow](https://stackoverflow.com/), which provided significant support during the initial phases, although it is not specific enough for our project.
