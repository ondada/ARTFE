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
    question: '만약 전시회에 간다면 <br> 어디로 갈까?',
    choices: [
      { text: '사진전이나 영상 전시회에 가서 눈에 담아올래!', value: 's' },
      { text: '미술가들의 작품에 대해 해석해보고 싶어ㅎㅎ', value: 'n' }
    ]
  },
  {
    number: '03',
    question: '같이 가기로 한 친구가 <br> 갑자기 아프다고 한다. 내 반응은?',
    choices: [
      { text: '헉 진짜? ㅠㅠ 괜찮아? 무슨 일이야??', value: 'f' },
      { text: '병원은 가봤어? 어디가 아픈거야?', value: 't' }
    ]
  },
  {
    number: '04',
    question: '어쩔 수 없지... 관람 후에 <br> 혼자 먹을 식당이 있나 미리 찾아볼까?',
    choices: [
      { text: '맛집 검색! 리뷰수 많은 식당으로~', value: 'j' },
      { text: '전시회 주변에 식당 있겠지~ 가서 찾아보자!', value: 'p' }
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
    question: '집에 가는 길 축제 입장권이 있다며 <br> 같이 가자는 친구에게...',
    choices: [
      { text: '무슨 축제인데? 가자!!', value: '' },
      { text: '난 안 갈래 ㅎㅎ (사람 너무 많을 것 같아..)', value: '' }
    ]
  },
  {
    number: '08',
    question: '축제에 가서 제일 하고 싶은 일은?',
    choices: [
      { text: '푸드트럭에서 이것 저것 먹어보기~', value: '' },
      { text: '다양한 체험을 해 볼 수 있는 문화 체험 부스', value: '' }
    ]
  },
  {
    number: '09',
    question: '축제에 도착했는데 부스가 여러개... <br> 어떤 부스에 먼저 가볼까?',
    choices: [
      { text: '시끌벅적한 음악이 틀어져있고 사람이 몰려 있는 부스', value: '' },
      { text: '다양한 체험을 해 볼 수 있는 문화 체험 부스', value: '' }
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
	jobs: ['<대전사이언스페스티벌><br>온 가족 모두가 함께 소통하고 즐기는 미래과학세상이 펼쳐집니다. AI체험, 코딩체험, 메타버스, 기초과학체험 등을 체험 할 수 있으며, 야간경관도 함께 즐길 수 있는 체류형 과학체험도 제공합니다. '],
    lectureImg: 'images/B02.jpg',
    lectureUrl: 'sangse.jsp?e_no=B02'
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
	jobs: ['<영화의 기후: 섬, 행성><br>부산현대미술관 최초의 정례전인 기획전《영화의 기후: 섬과 행성, 포스트콘택트존》은 세계적으로 이슈가 되고 있는 환경문제에 대한 담론을 제공하는 다양한 장르의 영화를 상영하는 전시이다. '],
    lectureImg: 'images/A39.jpg',
    lectureUrl: 'sangse.jsp?e_no=A39'
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
	jobs: ['<생태, 인류, 담양 展><br> 본 전시는지역 외부의 작가와 기획자가 담양을 제3의 시선으로 바라보고 지역의 특색을 탐구했습니다. 전라남도 담양군은 메타세콰이어 가로수길 등 자연의 정취를 오롯이 간직한 지역입니다. 이러한 특성에 맞춰 참여작가들은 지역을 답사하고 연구하여 현장설치, 미디어아트, 회화, 사진 등 다채로운 장르로 작품을 제작했습니다.'],
    lectureImg: 'images/A32.jpg',
    lectureUrl: 'sangse.jsp?e_no=A32'
  },
  {
    title: 'esfp', 
    character: 'images/result_character2.png',
    results: [
      '평소 다양한 지식에 관심이 많아요.',
      '자신이 좋아하는 분야에는 끝없이 파고들어요.',
      '주관이 뚜렷해요!<br>합리적인 생각을 잘해요.',
      '원리, 원칙주의자예요!'
    ],
	jobs: [' <슬릭><br> 알마로꼬 전시 브랜드 Slick의 첫 번째 미디어 아트 전시입니다. 오늘날 우리는 수많은 미디어를 통해 화면 속 자신의 모습에서 즐거움을 찾고 스스로를 비추어 보며 사랑합니다. 알마로꼬는 여기에 새로운 기술을 더해 색다른 시각으로 나를 바라볼 수 있도록 합니다.'],
    lectureImg: 'images/A03.jpg',
    lectureUrl: 'sangse.jsp?e_no=A03'
  },
  {
    title: 'esfj',
    character: 'images/result_character1.png',
    results: [
      '새로움을 추구하고 좋아해요.',
      '다수의 사람들과 노는 것이 일상이였으면 좋겠어요...',
      '사람들과의 상호작용을 통해 삶의 원동력을 얻어요!',
      '동선 낭비는 최악! <br> 어디어디 갈 지 다 정해놔야지ㅎㅎ'
    ],
	jobs: ['<천안흥타령춤페스티벌><br>다 함께 흥겨운 춤을! 감동이 담긴 신나는 축제! 천안흥타령춤축제 입니다. 흥으로! 춤으로! 천안으로! 다 함께 흥겨운 춤을!(Let’s Dance in Cheonan!) 천안의 흥타령 민요를 현대감각에 맞게 접목하여 다양한 춤과 음악으로 한데 어우러진 춤을 흥겹게 풀어내어 신명, 감동, 화합의 한마당 축제의 장을 만들어 냅니다.'],
    lectureImg: 'images/B62.jpg',
    lectureUrl: 'sangse.jsp?e_no=B62'
  },
  {
    title: 'enfj',
    character: 'images/result_character2.png',
    results: [
      '사람 자체를 좋아해요.',
      '무리에 속해 있는 것도 좋지만 마이웨이 기질도 약간 있어요.',
      '저는 저 스스로를 잘 알아요.',
      '계획 빼면 시체. 무슨 행사에 갈지는 제가 다 정해요!'
    ],
	jobs: ['<천안흥타령춤페스티벌><br>다 함께 흥겨운 춤을! 감동이 담긴 신나는 축제! 천안흥타령춤축제 입니다. 흥으로! 춤으로! 천안으로! 다 함께 흥겨운 춤을!(Let’s Dance in Cheonan!) 천안의 흥타령 민요를 현대감각에 맞게 접목하여 다양한 춤과 음악으로 한데 어우러진 춤을 흥겹게 풀어내어 신명, 감동, 화합의 한마당 축제의 장을 만들어 냅니다.'],
    lectureImg: 'images/B62.jpg',
    lectureUrl: 'sangse.jsp?e_no=B62'
  },
  {
    title: 'infp',
    character: 'images/result_character2.png',
    results: [
      '혼자 있는 건 좋은데 외로운 건 싫어요...',
      '가끔 우울한 나에 심취해 있을 때도 있어요. (하하...)',
      '타인이 보는 나에 대해 많이 생각해요.',
      '생각이 많아지는 전시라면 너무 좋을 것 같아요!'
    ],
	jobs: ['<어노니머스 프로젝트><br>  디렉터리 슐만이 수집한 80만 장의 컬러 필름 슬라이드 컬렉션입니다. 이 사진들은 가족, 친구 또는 연인 등 친밀한 관계에 있는 사람들이 촬영했기에 소중한 순간을 간직하고 싶은 애정이 사진에 온전히 드러납니다.'],
    lectureImg: 'images/A15.jpg',
    lectureUrl: 'sangse.jsp?e_no=A15'
  },
  {
    title: 'isfp',
    character: 'images/result_character2.png',
    results: [
      '예술 분야는 역시 흥미로워요.',
      '나는 집돌이, 집순이... <br> 그래도 가끔 전시 보러 가는 것도 나쁘지 않죠.',
      '혼자가 좋지만 막상 나가면 잘 놀고 와요.',
      '사람이 많은 곳은 그닥... <br> 관람객이 적은 오전타임을 노려볼래요'
    ],
	jobs: ['<어제의 미래><br>Maria의 포스트 모던적 비전은 관객이 인간 경험의 신비, 외로움, 고립에 반응하게끔 강요하는 대화를 대담하게 표현하고 있는데, 그럼에도 불구하고 수성 파스텔에 깊숙이 박혀 있는 그녀의 스타일은 보는 이의 시선으로 하여금 삶의 소박한 아름다움을 지속적인 경외심으로 바꾸는 방식을 제시하고 있다.'],
    lectureImg: 'images/A16.jpg',
    lectureUrl: 'sangse.jsp?e_no=A16'
  },
  {
    title: 'isfj',
    character: 'images/result_character2.png',
    results: [
      '계획 세우는 걸 좋아해요.',
      '공감능력이 뛰어나다고 생각해요. 실제로도 그래요 ㅎㅎ',
      '다른 사람의 감정을 잘 캐치해요!',
      '작품 볼 때 창작자의 마음을 생각해 본 적 있어요.'
    ],
	jobs: ['《Unnamed Road》전시는 사진가가 〈This Place〉프로젝트에서<br> 이스라엘과 요르단 강 서안지구를 담은 이미지들로부터 만들어졌습니다.<br>   ‘이름 없는 길 unnamed road’의 끝에는 분쟁 그 너머의 무언가가<br>  기다리고 있을 것 같습니다. '],
    lectureImg: 'images/A13.jpg',
    lectureUrl: 'sangse.jsp?e_no=A13'
  },
    {
    title: 'infj',
    character: 'images/result_character5.png',
    results: [
      '생각이 많고 망상이 잦아요.',
      '감수성이 풍부한 편이에요... 가끔 슬픈 영상도 찾아봐요',
      '새로운 사람을 만나는 것은 꽤 힘들어요.',
      '조용히 보고 올 수 있는 전시회는 좋은 것 같아요!'
    ],
		
    jobs: ['<치유의 기술><br> 우리나라를 대표하는 현대 미술가 21인이 참여합니다. 작가들이 언급하는 치유에 대한 메시지와 그것을 집약한 결과물을 찬찬히 따라 걷다 보면 예술과 치유의 본질에 대해서 깨닫게 될 것입니다.'],
    lectureImg: 'images/A14.jpg',
    lectureUrl: 'sangse.jsp?e_no=A14'
  },
    {
    title: 'estj',
    character: 'images/result_character5.png',
    results: [
      '문화 생활을 좋아해요.',
      '사람들이 아는 내 성격이랑 <br> 혼자 있을 때의 성격이랑 조금 달라요.',
      '계획이 조금이라도 틀어지는 건 용납 불가!',
      '새로운 체험에 도전해보는 것도 좋아해요.'
    ],
    jobs: ['<어둠속의 대화><br>아무것도 보이지 않는 어둠 속이지만 상상할 수 있는 모든 것이 존재합니다. 특별한 어둠 속의 매개자 ‘로드마스터’와 함께하는 100분 간의 흥미롭고 즐거운 경험을 통해 각자가 쌓아온 과거의 경험과 기억을 토대로 무의식 속에 잠재된 창의성을 발현할 수 있을것입니다.'],
    lectureImg: 'images/A17.jpg',
    lectureUrl: 'sangse.jsp?e_no=A17'
  },
    {
    title: 'istp',
    character: 'images/result_character5.png',
    results: [
      '혼자 문화생활을 즐기는 것을 선호해요.',
      '마이웨이라는 소리 자주 들어요 (ㅎㅎ)',
      '호불호가 확실하고 효율적인 걸 좋아해요!',
      '관찰력이 뛰어나서 전시회가면 <br> 작품을 뚫어져라 쳐다볼 수도 있어요...'
    ],
    jobs: ['<상상력에게><br> 숲에서 볼 수 있는 다양한 녹색들과 알 수 없는 짐승, 자연의 소리들 그리고 특유의 냄새는 자연스럽게 많은 것들을 상상하게 만들어 주었고, 동시에 위로와 우울함을 직면할 수 있었다. 숲이라는 대상을 통해서 내가 바라보는 사람들과 세상에 관한 이야기를 풀어나간다.'],
    lectureImg: 'images/A30.jpg',
    lectureUrl: 'sangse.jsp?e_no=A30'
  },
    {
    title: 'intj',
    character: 'images/result_character5.png',
    results: [
      '사람 많고 시끄러운 곳은 선호하지 않아요.',
      '어떤 작품에 대해 다각도로 해석하는 것을 좋아해요.',
      '이성적인데 또 감성적이에요!',
      '전시 보고, 저녁은 00에서 먹고, 가는 길에 00들려서... <br> 상당히 계획적이에요. (머쓱)'
    ],
    jobs: ['<어둠속의 대화><br>아무것도 보이지 않는 어둠 속이지만 상상할 수 있는 모든 것이 존재합니다. 특별한 어둠 속의 매개자 ‘로드마스터’와 함께하는 100분 간의 흥미롭고 즐거운 경험을 통해 각자가 쌓아온 과거의 경험과 기억을 토대로 무의식 속에 잠재된 창의성을 발현할 수 있을것입니다.'],
    lectureImg: 'images/A17.jpg',
    lectureUrl: 'sangse.jsp?e_no=A17'
  },
    {
    title: 'intp',
    character: 'images/result_character5.png',
    results: [
      '지식의 축복이 끝이 없네... 지식에 대한 욕망이 가득해요.',
      '관심 분야가 생기면 끝도 없이 깊어져요.',
      '괴짜라는 소리도 많이 들어요. (진지)',
      '교양을 쌓을 수 있는 전시회라면 당장 갈래요!'
    ],
    jobs: ['<대전사이언스페스티벌><br>온 가족 모두가 함께 소통하고 즐기는 미래과학세상이 펼쳐집니다. AI체험, 코딩체험, 메타버스, 기초과학체험 등을 체험 할 수 있으며, 야간경관도 함께 즐길 수 있는 체류형 과학체험도 제공합니다. '],
    lectureImg: 'images/B02.jpg',
    lectureUrl: 'sangse.jsp?e_no=B02'
  },
    {
    title: 'istj',
    character: 'images/result_character5.png',
    results: [
      '현실적이라 "만약에..." 라는 말은 듣고 싶지 않아요!',
      '원칙을 중요시 해서 일반적이고, 전통적인 걸 선호해요.',
      '실제 경험을 중요하게 생각해요.',
      '무언가를 체험해 보는 것도 나쁘지 않은 것 같아요.'
    ],
    jobs: ['<치유의 기술><br> 미디어 아트와 현대미술이 융합된 MUSEUM1의 새 전시치유의 기술은 코로나 시대를 살아가는 지친 현대인들에게 예술을 통한 치유와 위로의 메시지를 전달하고자 합니다. '],
    lectureImg: 'images/A14.jpg',
    lectureUrl: 'sangse.jsp?e_no=A14'
  },
    {
    title: 'enfp',
    character: 'images/result_character5.png',
    results: [
      '친구들이랑 같이 무언가 하는 것을 좋아해요 ㅎㅎ',
      '여러 문화를 체험할 수 있는 기회가 있다면 하겠어요!',
      '취미가 100개! 이것저것 해보고 싶어요',
      '가끔이지만, 혼자 있는 시간도 좋아요'
    ],
    jobs: ['<2023 대구콘텐츠페어><br> 고부가가치 콘텐츠 산업 축제 개최를 통한 지역 콘텐츠 기업 경쟁력 강화, 지역 내 유명 e-스포츠 게임대회 유치를 통한 대시민 게임 문화 인식 확산 및 건전한 게임 문화 형성 대구콘텐츠페어로 초대합니다!'],
    lectureImg: 'images/B10.jpg',
    lectureUrl: 'sangse.jsp?e_no=B10'
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
