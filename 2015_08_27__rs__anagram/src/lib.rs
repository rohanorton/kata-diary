use std::ascii::AsciiExt;

fn strip_whitespace(word: &str) -> String {
    str::replace(word, " ", "")
}

fn sort_string(word: &str) -> String {
    let mut chars: Vec<char> = word.chars().collect();
    chars.sort();
    chars.into_iter().collect()
}

fn word_fingerprint(word: &str) -> String {
    let sanitized_string =  strip_whitespace(&word.to_ascii_lowercase());
    sort_string(&sanitized_string)
}

pub fn is_anagram(word1: &str, word2: &str) -> bool {
     word_fingerprint(&word1) == word_fingerprint(&word2)
}

#[cfg(test)]
mod is_anagram {
    use super::*;
    #[test]
    fn it_should_return_true_if_word_is_same() {
        assert!(is_anagram("word", "word"));
    }
    #[test]
    fn it_should_return_false_if_word_does_not_contain_same_letters() {
        assert_eq!(is_anagram("word", "qwerty"), false);
    }
    #[test]
    fn it_should_return_true_if_word_contains_same_letters() {
        assert!(is_anagram("word", "dwor"));
    }
    #[test]
    fn it_should_return_true_if_word_contains_same_letters_but_mixed_case() {
        assert!(is_anagram("WoRd", "DwOr"));
    }
    #[test]
    fn it_should_ignore_whitespace() {
        assert!(is_anagram("word", "w o r d"));
    }
}
