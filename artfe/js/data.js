export const questions = [
  {
    number: '01',
    question: '힐링이 필요한 당신...<br>뭘 하면 좋을까?',
    choices: [
      { text: '혼자서 조용히 전시 보러 다녀와야겠다!', value: 'i' },
      { text: '지역 축제? 친구들한테 같이 가자고 해야지~', value: 'e' }
    ]
  },
  {
    number: '02',
    question: '산책하다가 공원에서 <br> 자연을 즐기는 건 어때?<br> ',
    choices: [
      { text: '중간에 비오면 어떡하지... 우산 안 챙길 건데', value: 's' },
      { text: '낭만적이야! 도시락도 싸서 가볼까~(두근두근)', value: 'n' }
    ]
  },
  {
    number: '03',
    question: '기다리던 외출! <br> 만나기로 한 친구가 아프다고 한다. <br> 당신은?',
    choices: [
      { text: '헉 진짜? ㅠㅠ 괜찮아? 무슨 일이야??', value: 'f' },
      { text: '병원은 가봤어? 어디가 아픈거야?', value: 't' }
    ]
  },
  {
    number: '04',
    question: '다녀와서 뭐 먹을지 <br> 미리 찾아볼까?',
    choices: [
      { text: '맛집 검색! 리뷰수 많은 식당으로~', value: 'j' },
      { text: '행사장 주변에 식당 있겠지~ 가서 찾아보자!', value: 'p' }
    ]
  },
  {
    number: '05',
    question: '전시회에 도착한 당신! <br> 관람하는 방식은?',
    choices: [
      { text: '도슨트 설명 들으면서 보니까 똑똑해진 기분이야', value: '' },
      { text: '설명은 안 들어도 돼. 눈에 많이 담아두자 ', value: '' }
    ]
  },
  {
    number: '06',
    question: '전시회 감상을 마치고<br>당신의 속마음은?',
    choices: [
      { text: '생각이 많아진다... 마음이 차분해져 ㅎㅎ', value: '' },
      { text: '아직 부족해. 신나는 무언가를 하고 싶어!', value: '' }
    ]
  },
  {
    number: '07',
    question: '축제 입장권이 있다며 <br> 같이 가자는 친구에게...',
    choices: [
      { text: '무슨 축제인데? 가자!!', value: '' },
      { text: '난 안 갈래 ㅎㅎ (사람 너무 많을 것 같아..)', value: '' }
    ]
  },
  {
    number: '08',
    question: '축제에 도착했는데 부스가 여러개... <br> 어떤 부스에 먼저 가볼까?',
    choices: [
      { text: '시끌벅적한 음악이 틀어져있고 사람이 몰려 있는 부스', value: '' },
      { text: '다양한 체험을 해 볼 수 있는 문화 체험 부스', value: '' }
    ]
  },
  {
    number: '09',
    question: '다 마치고 집으로 돌아가는 길 <br> 오늘 하루 제일 기억에 남은 것은?',
    choices: [
      { text: '여러 작품들을 볼 수 있는 전시회는 최고였어!', value: '' },
      { text: '많은 사람들도 만나고 체험도 했던 축제... <br>또 가고 싶다~', value: '' }
    ]
  },
  {
    number: '10',
    question: '집으로 돌아온 당신 <br> 오늘 하루를 정리하는 방식은?',
    choices: [
      { text: '오늘 찍은 사진들을 보며 하루를 정리한다.', value: '' },
      { text: '하루동안의 감정을 일기에 담아낼래! (끄적끄적)', value: '' }
    ]
  },
]
export const results = [
  {
    title: 'entj',
    character: 'images/result_character1.png',
    results: [
      '활동적이고 집돌이, 집순이 기질은 아니에요.',
      '사람 만나는 거 좋아요... 좋은데... <br> 깊은 인간 관계를 맺는 것은 별로예요. ',
      '리더십 있다는 소리를 자주 들어요.<br>추진력이 있는 편이죠!',
      '사람 많을 땐 정상인, <br> 혼자 있을 땐 몽상가인 저는 무슨 행사든 다 좋아요'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
  {
    title: 'entp',
    character: 'images/result_character2.png',
    results: [
      '독립적인 성향이 강해요.',
      '직설적이고 솔직하게 제 마음을 표현하는 편이에요.',
      '다른 사람이 나를 어떻게 생각하든지 상관없어요.',
      '진행력 갑! 가고 싶은 곳 있으면 바로 추진해요.'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
  {
    title: 'estp',
    character: 'images/result_character3.png',
    results: [
      '표현을 아끼지 않아요.',
      '사람 만나는 거 좋아하지만 <br> 몸이 안 따라줘서 안 나간 적도 있어요.',
      '하고 싶은 거 다 하면서 사는 편이에요!',
      '모험을 즐기기도 해서 어떤 행사든 갈 마음이 있어요.'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
  {
    title: 'esfp', 
    character: 'images/',
    results: [
      '평소 다양한 지식에 관심이 많아요.',
      '자신이 좋아하는 분야에는 끝없이 파고들어요.',
      '주관이 뚜렷해요!<br>합리적인 생각을 잘해요.',
      '원리, 원칙주의자예요!'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
  {
    title: 'esfj',
    character: 'images/result_character5.png',
    results: [
      '새로움을 추구하고 좋아해요.',
      '다수의 사람들과 노는 것이 일상이였으면 좋겠어요...',
      '사람들과의 상호작용을 통해 삶의 원동력을 얻어요!',
      '동선 낭비는 최악! <br> 어디어디 갈 지 다 정해놔야지ㅎㅎ'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
  {
    title: 'enfj',
    character: 'images/result_character6.png',
    results: [
      '사람 자체를 좋아해요.',
      '무리에 속해 있는 것도 좋지만 마이웨이 기질도 약간 있어요.',
      '저는 저 스스로를 잘 알아요.',
      '계획 빼면 시체. 무슨 행사에 갈지는 제가 다 정해요!'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
  {
    title: 'infp',
    character: 'images/result_character6.png',
    results: [
      '혼자 있는 건 좋은데 외로운 건 싫어요...',
      '가끔 우울한 나에 심취해 있을 때도 있어요. (하하...)',
      '타인이 보는 나에 대해 많이 생각해요.',
      '생각이 많아지는 전시라면 너무 좋을 것 같아요!'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
  {
    title: 'isfp',
    character: 'images/result_character6.png',
    results: [
      '예술 분야는 역시 흥미로워요.',
      '나는 집돌이, 집순이... <br> 그래도 가끔 전시 보러 가는 것도 나쁘지 않죠.',
      '혼자가 좋지만 막상 나가면 잘 놀고 와요.',
      '사람이 많은 곳은 그닥... <br> 관람객이 적은 오전타임을 노려볼래요'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
  {
    title: 'isfj',
    character: 'images/result_character6.png',
    results: [
      '계획 세우는 걸 좋아해요.',
      '공감능력이 뛰어나다고 생각해요. 실제로도 그래요 ㅎㅎ',
      '다른 사람의 감정을 잘 캐치해요!',
      '작품 볼 때 창작자의 마음을 생각해 본 적 있어요.'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
    {
    title: 'infj',
    character: 'images/result_character6.png',
    results: [
      '생각이 많고 망상이 잦아요.',
      '감수성이 풍부한 편이에요... 가끔 슬픈 영상도 찾아봐요',
      '새로운 사람을 만나는 것은 꽤 힘들어요.',
      '조용히 보고 올 수 있는 전시회는 좋은 것 같아요!'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
    {
    title: 'estj',
    character: 'images/result_character6.png',
    results: [
      '목표를 설정해놓고 이룰때까지 한 우물만 파요.',
      '사람들이 아는 내 성격이랑 <br> 혼자 있을 때의 성격이랑 조금 달라요.',
      '계획이 조금이라도 틀어지는 건 용납 불가!',
      '어떤 행사에 갈 땐 리뷰도 많이 찾아봐요.'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
    {
    title: 'istp',
    character: 'images/result_character6.png',
    results: [
      '혼자 문화생활을 즐기는 것을 선호해요.',
      '마이웨이라는 소리 자주 들어요 (ㅎㅎ)',
      '호불호가 확실하고 효율적인 걸 좋아해요!',
      '관찰력이 뛰어나서 전시회가면 <br> 작품을 뚫어져라 쳐다볼 수도 있어요...'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
    {
    title: 'intj',
    character: 'images/result_character6.png',
    results: [
      '사람 많고 시끄러운 곳은 선호하지 않아요.',
      '어떤 작품에 대해 다각도로 해석하는 것을 좋아해요.',
      '이성적인데 또 감성적이에요!',
      '전시 보고, 저녁은 00에서 먹고, 가는 길에 00들려서... <br> 상당히 계획적이에요. (머쓱)'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
    {
    title: 'intp',
    character: 'images/result_character6.png',
    results: [
      '지식의 축복이 끝이 없네... 지식에 대한 욕망이 가득해요.',
      '관심 분야가 생기면 끝도 없이 깊어져요.',
      '괴짜라는 소리도 많이 들어요. (진지)',
      '교양을 쌓을 수 있는 전시회라면 당장 갈래요!'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
    {
    title: 'istj',
    character: 'images/result_character6.png',
    results: [
      '현실적이라 "만약에..." 라는 말은 듣고 싶지 않아요!',
      '원칙을 중요시 해서 일반적이고, 전통적인 걸 선호해요.',
      '실제 경험을 중요하게 생각해요.',
      '무언가를 체험해 보는 것도 나쁘지 않은 것 같아요.'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  },
    {
    title: 'enfp',
    character: 'images/result_character6.png',
    results: [
      '친구들이랑 같이 무언가 하는 것을 좋아해요 ㅎㅎ',
      '여러 문화를 체험할 수 있는 기회가 있다면 하겠어요!',
      '취미가 100개! 이것저것 해보고 싶어요',
      '가끔이지만, 혼자 있는 시간도 좋아요'
    ],
    lectureImg: 'images/A01.jpg',
    lectureUrl: 'event.jsp'
  }
]
export const mbtis = {
  entj: 0,
  entp: 1,
  estp: 2,
  esfp: 3,
  esfj: 4,
  enfj: 5,
  infp: 6,
  isfp: 7,
  isfj: 8,
  infj: 9,
  estj: 10,
  istp: 11,
  intj: 12,
  intp: 13,
  istj: 14,
  enfp: 15

}
