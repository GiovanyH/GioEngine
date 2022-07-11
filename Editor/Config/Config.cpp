#include "Config.h"

static bool TokenizeCStyleString(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end) {
	const char * p = in_begin;

	if (*p == '"') {
		p++;

		while (p < in_end) {
			if (*p == '"') {
				out_begin = in_begin;
				out_end = p + 1;
				return true;
			}

			if (*p == '\\' && p + 1 < in_end && p[1] == '"') p++;

			p++;
		}
	}

	return false;
}

static bool TokenizeCStyleCharacterLiteral(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end) {
	const char * p = in_begin;

	if (*p == '\'') {
		p++;

		if (p < in_end && *p == '\\') p++;

		if (p < in_end) p++;

		if (p < in_end && *p == '\'') {
			out_begin = in_begin;
			out_end = p + 1;
			return true;
		}
	}

	return false;
}

static bool TokenizeCStyleIdentifier(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end) {
	const char * p = in_begin;

	if ((*p >= 'a' && *p <= 'z') || (*p >= 'A' && *p <= 'Z') || *p == '_') {
		p++;

		while ((p < in_end) && ((*p >= 'a' && *p <= 'z') || (*p >= 'A' && *p <= 'Z') || (*p >= '0' && *p <= '9') || *p == '_')) p++;

		out_begin = in_begin;
		out_end = p;
		return true;
	}

	return false;
}

static bool TokenizeCStyleNumber(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end) {
	const char * p = in_begin;

	const bool startsWithNumber = *p >= '0' && *p <= '9';

	if (*p != '+' && *p != '-' && !startsWithNumber) return false;

	p++;

	bool hasNumber = startsWithNumber;

	while (p < in_end && (*p >= '0' && *p <= '9')) {
		hasNumber = true;

		p++;
	}

	if (hasNumber == false) return false;

	bool isFloat = false;
	bool isHex = false;
	bool isBinary = false;

	if (p < in_end) {
		if (*p == '.')
		{
			isFloat = true;

			p++;

			while (p < in_end && (*p >= '0' && *p <= '9')) p++;
		}
		else if (*p == 'x' || *p == 'X') {
			isHex = true;

			p++;

			while (p < in_end && ((*p >= '0' && *p <= '9') || (*p >= 'a' && *p <= 'f') || (*p >= 'A' && *p <= 'F'))) p++;
		}
		else if (*p == 'b' || *p == 'B') {
			isBinary = true;

			p++;

			while (p < in_end && (*p >= '0' && *p <= '1')) p++;
		}
	}

	if (isHex == false && isBinary == false) {
		if (p < in_end && (*p == 'e' || *p == 'E')) {
			isFloat = true;

			p++;

			if (p < in_end && (*p == '+' || *p == '-')) p++;

			bool hasDigits = false;

			while (p < in_end && (*p >= '0' && *p <= '9')) {
				hasDigits = true;
				p++;
			}

			if (hasDigits == false) return false;
		}

		if (p < in_end && *p == 'f') p++;
	}

	if (isFloat == false) {
		while (p < in_end && (*p == 'u' || *p == 'U' || *p == 'l' || *p == 'L')) p++;
	}

	out_begin = in_begin;
	out_end = p;
	return true;
}

static bool TokenizeCStylePunctuation(const char *in_begin, const char *in_end, const char *&out_begin, const char *&out_end) {
	(void)in_end;

	switch (*in_begin)
	{
		case '[':
		case ']':
		case '{':
		case '}':
		case '!':
		case '%':
		case '^':
		case '&':
		case '*':
		case '(':
		case ')':
		case '-':
		case '+':
		case '=':
		case '~':
		case '|':
		case '<':
		case '>':
		case '?':
		case ':':
		case '/':
		case ';':
		case ',':
		case '.':
		out_begin = in_begin;
		out_end = in_begin + 1;
		return true;
	}

	return false;
}
