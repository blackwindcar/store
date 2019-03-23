class userStore{

    constructor() {
        this.user = ""
        this.pass = "";
        this.nome = "";
        this.email = "";
        this.tipo = -1;
        this.morada= "";
        this.nif = "";
        this.tel = 0;
        this.confirm = false;
        this.authentication = false;
        this.executaFuncao = false;
        this.funcaoAuthentication = function(){};
    }


    pedeauthentication (value){
        var xmlhttp = new XMLHttpRequest();

        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                value.authentication= this.responseText;
                if(value.executaFuncao){
                    value.funcaoAuthentication();
                }
            }
        };

        xmlhttp.open("GET", "php/authenticateuser.php?user=" + this.user + "&pass=" + this.pass, true);
        xmlhttp.send();
    }

    validate(user,pass){
        this.user = user;
        this.pass= pass;
        this.pedeauthentication(this);
    }

    addFuncaoAuthentication(funcao){
        this.executaFuncao = true;
        this.funcaoAuthentication = funcao;
    }

    removeFuncaoAuthentication(){
        this.executaFuncao = false;
        this.funcaoAuthentication = function(){};
    }

    creatUser(user,pass,tipo,nome,email,morada,tel,nif,confirm, value = this){

        this.user = user;
        this.pass = pass;
        this.tipo = tipo;
        this.nome = nome;
        this.email = email;
        this.morada = morada;
        this.tel = tel;
        this.nif = nif;
        this.confirm = confirm;


        var xmlhttp = new XMLHttpRequest();

        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                value.authentication= this.responseText;
                if(value.executaFuncao){
                    value.funcaoAuthentication();
                }
            }
        };

        xmlhttp.open("GET", "php/authenticateuser.php?user=" + this.user + "&pass=" + this.pass, true);
        xmlhttp.send();
    }



}