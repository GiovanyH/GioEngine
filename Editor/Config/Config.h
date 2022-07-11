#pragma once
template<class InputIt1, class InputIt2, class BinaryPredicate>
bool equals(InputIt1 first1, InputIt1 last1, InputIt2 first2, InputIt2 last2, BinaryPredicate p) {
	for (; first1 != last1 && first2 != last2; ++first1, ++first2) {
		if (!p(*first1, *first2))
			return false;
	}
	return first1 == last1 && first2 == last2;
}

static inline int ImTextCharToUtf8(char *buf, int buf_size, unsigned int c);
static bool IsUTFSequence(char c) { return (c & 0xC0) == 0x80; }
static bool TokenizeCStyleString(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end);
static bool TokenizeCStyleCharacterLiteral(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end);
static bool TokenizeCStyleIdentifier(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end);
static bool TokenizeCStyleNumber(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end);
static bool TokenizeCStylePunctuation(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end);
