const test = document.querySelectorAll('.input');
const contenu = document.querySelectorAll('.affiche');
var domicile = document.getElementById('domicile');
var vehicule = document.getElementById('vehicule');
var vehicule_ok = document.getElementById('vehicule_ok');
var immatriculation = document.getElementById('immatriculation');
var papiers = document.getElementById('papiers');
var assurance_non = document.getElementById('assurance_non');
var assurance_oui = document.getElementById('assurance_oui');
var etablissement = document.getElementById('etablissement');
var sous_groupe = document.getElementById('sous_groupe');
var submit = document.getElementById('submit');
var permis_oui = document.getElementById('permis_oui');
var permis_non = document.getElementById('permis_non');
var permis_ok = document.getElementById('permis_ok');


domicile.addEventListener('click',()=>{
    vehicule.classList.add('affiche');
})

vehicule_oui.addEventListener('click',()=> {
    vehicule_ok.classList.add('affiche');
    immatriculation.addEventListener('click', ()=>{
        papiers.classList.add('affiche');
    })
}) 



vehicule_non.addEventListener('click',()=>{
    etablissement.classList.add('affiche');
    permis_non.setAttribute("checked", "");
    var point_permis = document.getElementById('point_permis');
    point_permis.setAttribute("value", "0");
    etablissement.classList.add('affiche');
    var cg = document.getElementById('cg_non');
    cg.setAttribute("checked", "");
    var ct = document.getElementById('ct_non');
    ct.setAttribute("checked", "");
    assurance_non.setAttribute("checked", "");
})


permis_oui.addEventListener('click',()=> {
    permis_ok.classList.add('affiche');
}) 

permis_non.addEventListener('click',()=>{
    var point_permis = document.getElementById('point_permis');
    point_permis.setAttribute("value", "0");
    etablissement.classList.add('affiche');
    var cg = document.getElementById('cg_non');
    cg.setAttribute("checked", "");
    var ct = document.getElementById('ct_non');
    ct.setAttribute("checked", "");
    assurance_non.setAttribute("checked", "");
})

assurance_oui.addEventListener('click',()=>{
    etablissement.classList.add('affiche');
})

assurance_non.addEventListener('click',()=>{
    etablissement.classList.add('affiche');
})

sous_groupe.addEventListener('click',()=>{
    submit.classList.add('affiche');
})
