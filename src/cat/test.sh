#!/bin/bash

echo
echo "1. Проверка с пустым файлом empty.txt. 
Создание пустого файла. Ввод после вызова утилиты: empty.txt"
touch empty.txt
./s21_cat empty.txt > s21_cat_output.txt
cat empty.txt > cat_output.txt
diff s21_cat_output.txt cat_output.txt
if [ $? -eq 0 ]; then
    echo "  Успешно"
else
    echo "  Ошибка"
fi

echo

echo "2. Проверка с несуществующим файлом. 
Ввод после вызова утилиты: non_file.txt"
./s21_cat non_file.txt 2> s21_cat_error.txt
cat non_file.txt 2> cat_error.txt
awk -F: '{print $2, $3}' s21_cat_error.txt > s21_cat_error_part.txt
awk -F: '{print $2, $3}' cat_error.txt > cat_error_part.txt
diff s21_cat_error_part.txt cat_error_part.txt
if [ $? -eq 0 ]; then
    echo "  Успешно"
else 
    echo "  Ошибка"
fi
echo
echo "Создание текстового файла для тестов."
touch text.txt
echo -e "‰‭(਩‱‭Ĩ਩′‭Ȩ਩″‭̨਩‴‭Ш਩‵‭Ԩ਩‶‭ب਩‷‭ܨ਩‸‭ࠨ਩‹‭न਩〱ⴠ⠠⤊ㄊ‱‭ନ਩㈱ⴠ⠠⤌ㄊ″‭ਨ਩㐱ⴠ⠠⤎ㄊ‵‭༨਩㘱ⴠ⠠⤐ㄊ‷‭ᄨ਩㠱ⴠ⠠⤒ㄊ‹‭ጨ਩〲ⴠ⠠⤔㈊‱‭ᔨ਩㈲ⴠ⠠⤖㈊″‭ᜨ਩㐲ⴠ⠠⤘㈊‵‭ᤨ਩㘲ⴠ⠠⤚㈊‷‭ᬨ਩㠲ⴠ⠠⤜㈊‹‭ᴨ਩〳ⴠ⠠⤞㌊‱‭Ἠ਩㈳ⴠ⠠⤠㌊″‭ℨ਩㐳ⴠ⠠⤢㌊‵‭⌨਩㘳ⴠ⠠⤤㌊‷‭┨਩㠳ⴠ⠠⤦㌊‹‭✨਩〴ⴠ⠠⤨㐊‱‭⤨਩㈴ⴠ⠠⤪㐊″‭⬨਩㐴ⴠ⠠⤬㐊‵‭⴨਩㘴ⴠ⠠⤮㐊‷‭⼨਩㠴ⴠ⠠⤰㐊‹‭ㄨ਩〵ⴠ⠠⤲㔊‱‭㌨਩㈵ⴠ⠠⤴㔊″‭㔨਩㐵ⴠ⠠⤶㔊‵‭㜨਩㘵ⴠ⠠⤸㔊‷‭㤨਩㠵ⴠ⠠⤺㔊‹‭㬨਩〶ⴠ⠠⤼㘊‱‭㴨਩㈶ⴠ⠠⤾㘊″‭㼨਩㐶ⴠ⠠⥀㘊‵‭䄨਩㘶ⴠ⠠⥂㘊‷‭䌨਩㠶ⴠ⠠⥄㘊‹‭䔨਩〷ⴠ⠠⥆㜊‱‭䜨਩㈷ⴠ⠠⥈㜊″‭䤨਩㐷ⴠ⠠⥊㜊‵‭䬨਩㘷ⴠ⠠⥌㜊‷‭䴨਩㠷ⴠ⠠⥎㜊‹‭伨਩〸ⴠ⠠⥐㠊‱‭儨਩㈸ⴠ⠠⥒㠊″‭匨਩㐸ⴠ⠠⥔㠊‵‭唨਩㘸ⴠ⠠⥖㠊‷‭在਩㠸ⴠ⠠⥘㠊‹‭夨਩〹ⴠ⠠⥚㤊‱‭嬨਩㈹ⴠ⠠⥜㤊″‭崨਩㐹ⴠ⠠⥞㤊‵‭弨਩㘹ⴠ⠠⥠㤊‷‭愨਩㠹ⴠ⠠⥢㤊‹‭挨਩〱‰‭搨਩〱‱‭攨਩〱′‭昨਩〱″‭木਩〱‴‭栨਩〱‵‭椨਩〱‶‭樨਩〱‷‭欨਩〱‸‭氨਩〱‹‭洨਩ㄱ‰‭渨਩ㄱ‱‭漨਩ㄱ′‭瀨਩ㄱ″‭焨਩ㄱ‴‭爨਩ㄱ‵‭猨਩ㄱ‶‭琨਩ㄱ‷‭用਩ㄱ‸‭瘨਩ㄱ‹‭眨਩㈱‰‭砨਩㈱‱‭礨਩㈱′‭稨਩㈱″‭笨਩㈱‴‭簨਩㈱‵‭紨਩㈱‶‭縨਩㈱‷‭缨਩
!@#$%^&*()_+<>?\/
    Hello, my dear!
    
    Hello, my dear!
Hello, my dear!


Hello, my dear!





Hello, my dear!" > text.txt
echo
echo "3. Вывод без флага. Ввод после вызова утилиты:"
./s21_cat text.txt > outputS21.txt
cat text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "4. Проверка с несуществующим флагом. 
Ввод после вызова утилиты: -k text.txt"
./s21_cat -k text.txt > outputS21.txt
cat -k text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "5. Проверка коротких флагов -b, -e(-v), -n, -s, -t(-v). 
Ввод после вызова утилиты:"
echo
echo "-b text.txt"
./s21_cat -b text.txt > outputS21.txt
cat -b text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-e text.txt"
./s21_cat -e text.txt > outputS21.txt
cat -e text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-n text.txt"
./s21_cat -n text.txt > outputS21.txt
cat -n text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-s text.txt"
./s21_cat -s text.txt > outputS21.txt
cat -s text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-t text.txt"
./s21_cat -t text.txt > outputS21.txt
cat -t text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "6. Проверка флагов GNU --number-nonblank, -E, --number, --squeeze-blank, -T. 
Ввод после вызова утилиты:"
echo
echo "--number-nonblank text.txt"
./s21_cat --number-nonblank text.txt > outputS21.txt
cat --number-nonblank text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-E text.txt"
./s21_cat -E text.txt > outputS21.txt
cat -E text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "--number text.txt"
./s21_cat --number text.txt > outputS21.txt
cat --number text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "--squeeze-blank text.txt"
./s21_cat --squeeze-blank text.txt > outputS21.txt
cat --squeeze-blank text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-T text.txt"
./s21_cat -T text.txt > outputS21.txt
cat -T text.txt > outputCat.txt
diff outputS21.txt outputCat.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo

rm *.txt


