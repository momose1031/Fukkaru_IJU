'use strict'

// タイピング
{
  const typing = document.getElementById('typing');
  const content = document.getElementById('content');
  const text = document.getElementById('text');
  const content2 = document.createElement('div');
  
  const words = ["fukkarutoha", "ijutoha", "fukkaruijutoha"]
  const titles = ["フッ軽とは", "IJUとは", "フッ軽IJUとは"]
  let word;
  let num = 0;
  let isPlaying = false;
  let description;
  
  typing.addEventListener('click', () => {
    if (isPlaying === true) {return;}
    isPlaying = true;
    word = words.splice(0, 1)[0];
    let title = titles.splice(0, 1);
    description = descriptions.splice(0, 1);
    content.textContent = title;
    text.textContent = "上のローマ字を実際にタイピングしてみよう！";
    content2.textContent = word;
    typing.insertBefore(content2, text);
    document.addEventListener('keydown', e => {
      if (e.key !== word[num]) {return;}
      num++;
      content2.textContent = " _".repeat(num) + word.substring(num);
      if (num === word.length) {
        content2.textContent = "";
        text.textContent = description;
        num = 0;
        if (words.length !==0){
          isPlaying = false;
        } else {
          isPlaying = true;
        }
      }
    });
  });
  
  const descriptions = [
    "フッ軽＝フットワークが軽いこと。移住は敷居が高いものであるため、当サイトでは気軽に考えて欲しいという思いをこめて『フッ軽』とつけました！！",
    "IJU＝移住のこと。IターンUターンJターンの頭文字でもあります。Iターン：都市部から出身地の異なる地方への移住。Jターン：出身地の地方から都市部へ移住、その後出身地と異なる地方へ移住すること。Uターン：地方から都市部へ移住、その後再びその地方へ戻ってくること。",
    "気軽に地方移住を検討していただけるサイトです。登録なしでも閲覧はできますが、新規登録をすると投稿にいいね、コメント、フォロー、チャットができます。私の地元山梨では、歯止めの効かない若者の県外流出により、「高齢化」「人口減少」「後継者不足」が深刻化したことで、使い道の無くなった空き家がたくさんあります。私自身も亡き祖父母の家が空き家になってしまうため、そこに住み家を守っています。当サイトを通して少しでも多くの人に地方移住に興味を持ってもらい、今後さらに加速していくであろう空き家の問題が解決され、地域が繁栄することを祈っています。"
  ]
}

// タブメニュー
{
  const menuItems = document.querySelectorAll('.menu li a');
  const contents = document.querySelectorAll('.content');

  menuItems.forEach(clicked => {
    clicked.addEventListener('click', e => {
      e.preventDefault();

      menuItems.forEach(item => {
        item.classList.remove('active');
      });
      clicked.classList.add('active');

      contents.forEach(content => {
        content.classList.remove('active')
      });
      document.getElementById(clicked.dataset.id).classList.add('active');
    });
  });
}