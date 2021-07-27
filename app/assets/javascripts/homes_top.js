// topページローディング
/*global $*/
$(window).on('load', () => {
  $("#splash").delay(1500).fadeOut('slow');
  $("#splash_logo").delay(1500).fadeOut('slow');
})

// topページ　LINE風
const lineAdmins = [
  '富士山が綺麗だよね',
  '都心から意外と近い！！',
  '水が美味しい',
  'ワインの聖地',
  '自然が豊かだよ',
  'フルーツ王国🍑🍇',
  '空気がおいしい！',
  '富士急ハイランド',
  '温泉がたくさん！',
  '景色がキレイ！',
  '夜景がたくさん！',
  '武田信玄',
  'ミネラルウォーター生産量日本一',
  '桃🍑・ぶどう🍇・ほうとう'
]

const lineCustomers = [
  'だよね〜！',
  '山梨住んじゃおうかな！',
  '移住しちゃう？',
  'いいね！',
  'そうなんだ〜',
  'そこがいいよね！',
  '山梨サイコー！',
  'なんか山梨住みたくなってきたなぁ…'
]

let line = document.getElementById('line-top');
const btn1 = document.getElementById('btn-admin');
const btn2 = document.getElementById('btn-customer');

btn1.addEventListener('click', () => {
  var lineAdmin = document.createElement('div');
  lineAdmin.classList.add('line-admin');
  const afaceicon = document.createElement('div');
  afaceicon.classList.add('a-faceicon');
  const aImg = document.createElement('img');
  aImg.src = "assets/peach.jpg";
  aImg.classList.add('left-img')
  afaceicon.appendChild(aImg);
  lineAdmin.appendChild(afaceicon);
  const chatting = document.createElement('div');
  chatting.classList.add('chatting');
  const says = document.createElement('div');
  says.classList.add('says');
  chatting.appendChild(says);
  const p1 = document.createElement('p');
  p1.textContent = lineAdmins[Math.floor(Math.random() * lineAdmins.length)];
  says.appendChild(p1);
  lineAdmin.appendChild(chatting);
  line.appendChild(lineAdmin);
});

btn2.addEventListener('click', () => {
  const lineCustomer = document.createElement('div');
  lineCustomer.classList.add('line-customer');
  const p2 = document.createElement('p');
  p2.textContent = lineCustomers[Math.floor(Math.random() * lineCustomers.length)];
  lineCustomer.appendChild(p2);
  const cfaceicon = document.createElement('div');
  cfaceicon.classList.add('c-faceicon');
  const cImg = document.createElement('img');
  cImg.src = "assets/illust_human.jpg";
  cImg.classList.add('right-img')
  cfaceicon.appendChild(cImg);
  lineCustomer.appendChild(cfaceicon);
  line.appendChild(lineCustomer);
});