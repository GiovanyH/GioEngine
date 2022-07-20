#include <limits>
#include "texteditor.h"
#include "config.h"

void TextEditor::SetColorizerEnable(bool aValue) {
	mColorizerEnabled = aValue;
}

const TextEditor::Palette & TextEditor::GetDarkPalette() {
	const static Palette p = { {
		0xf9f5d7,	// Default
		0xffd69c56,	// Keyword	
		0xff00ff00,	// Number
		0xff7070e0,	// String
		0xff70a0e0, // Char literal
		0xffffffff, // Punctuation
		0xff408080,	// Preprocessor
		0xffaaaaaa, // Identifier
		0xff9bc64d, // Known identifier
		0xffc040a0, // Preproc identifier
		0xff206020, // Comment (single line)
		0xff406020, // Comment (multi line)
		0xff101010, // Background
		0xffe0e0e0, // Cursor
		0x80a06020, // Selection
		0xff707000, // Line number
		0x40000000, // Current line fill
		0x40808080, // Current line fill (inactive)
		0x40a0a0a0, // Current line edge
	} };
	return p;
}

void TextEditor::Colorize(int aFromLine, int aLines) {
	int toLine = aLines == -1 ? (int)mLines.size() : std::min((int)mLines.size(), aFromLine + aLines);
	mColorRangeMin = std::min(mColorRangeMin, aFromLine);
	mColorRangeMax = std::max(mColorRangeMax, toLine);
	mColorRangeMin = std::max(0, mColorRangeMin);
	mColorRangeMax = std::max(mColorRangeMin, mColorRangeMax);
	mCheckComments = true;
}

void TextEditor::ColorizeRange(int aFromLine, int aToLine) {
	if (mLines.empty() || aFromLine >= aToLine) return;

	std::string buffer;
	std::cmatch results;
	std::string id;

	int endLine = std::max(0, std::min((int)mLines.size(), aToLine));
	for (int i = aFromLine; i < endLine; ++i) {
		auto& line = mLines[i];

		if (line.empty()) continue;

		buffer.resize(line.size());
		for (size_t j = 0; j < line.size(); ++j) {
			auto& col = line[j];
			buffer[j] = col.mChar;
			col.mColorIndex = PaletteIndex::Default;
		}

		const char * bufferBegin = &buffer.front();
		const char * bufferEnd = bufferBegin + buffer.size();

		auto last = bufferEnd;

		for (auto first = bufferBegin; first != last; ) {
			const char * token_begin = nullptr;
			const char * token_end = nullptr;
			PaletteIndex token_color = PaletteIndex::Default;

			bool hasTokenizeResult = false;

			if (mLanguageDefinition.mTokenize != nullptr) {
				if (mLanguageDefinition.mTokenize(first, last, token_begin, token_end, token_color)) hasTokenizeResult = true;
			}

			if (hasTokenizeResult == false) {
				for (auto& p : mRegexList) {
					if (std::regex_search(first, last, results, p.first, std::regex_constants::match_continuous)) {
						hasTokenizeResult = true;

						auto& v = *results.begin();
						token_begin = v.first;
						token_end = v.second;
						token_color = p.second;
						break;
					}
				}
			}

			if (hasTokenizeResult == false) {
				first++;
			}
			else {
				const size_t token_length = token_end - token_begin;

				if (token_color == PaletteIndex::Identifier) {
					id.assign(token_begin, token_end);

					if (!line[first - bufferBegin].mPreprocessor) {
						if (mLanguageDefinition.mKeywords.count(id) != 0) token_color = PaletteIndex::Keyword;
						else if (mLanguageDefinition.mIdentifiers.count(id) != 0) token_color = PaletteIndex::KnownIdentifier;
						else if (mLanguageDefinition.mPreprocIdentifiers.count(id) != 0) token_color = PaletteIndex::PreprocIdentifier;
					}
					else {
						if (mLanguageDefinition.mPreprocIdentifiers.count(id) != 0) token_color = PaletteIndex::PreprocIdentifier;
					}
				}

				for (size_t j = 0; j < token_length; ++j) line[(token_begin - bufferBegin) + j].mColorIndex = token_color;
				first = token_end;
			}
		}
	}
}

