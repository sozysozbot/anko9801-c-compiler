#include "hcc.h"
#include "error.h"

// エラーを報告するための関数
// printfと同じ引数を取る
/* void error(char *fmt, ...) { */
/* 	va_list ap; */
/* 	va_start(ap, fmt); */
/* 	vfprintf(stderr, fmt, ap); */
/* 	fprintf(stderr, "\n"); */
/* 	exit(1); */
/* } */

void current_token(Token *tok) {
	char buf[100];
	strncpy(buf, tok->str, tok->len);
	buf[tok->len] = 0;
	fprintf(stderr, "Current token is: %s(%d, ", buf, tok->len);
	switch (tok->kind) {
	case TK_RESERVED:
		fprintf(stderr, "reserved");
		break;
	case TK_NUM:
		fprintf(stderr, "num");
		break;
	case TK_STRING:
		fprintf(stderr, "string");
		break;
	case TK_IDENT:
		fprintf(stderr, "ident");
		break;
	case TK_RETURN:
		fprintf(stderr, "return");
		break;
	case TK_EOF:
		fprintf(stderr, "EOF");
		break;
	}
	fprintf(stderr, ")\n");
}

// エラーの起きた場所を報告するための関数
// 下のようなフォーマットでエラーメッセージを表示する
//
// foo.c:10: x = y + + 5;
//                   ^ 式ではありません
void error_at(char *loc, char *fmt) {
	// locが含まれている行の開始地点と終了地点を取得
	char *line = loc;
	int tab_num = 0;
	while (user_input < line && line[-1] != '\n') {
		line--;
		if (*line == '\t')
			tab_num++;
	}

	char *end = loc;
	while (*end != '\n')
		end++;

	// 見つかった行が全体の何行目なのかを調べる
	int line_num = 1;
	for (char *p = user_input; p < line; p++)
		if (*p == '\n')
			line_num++;

	// 見つかった行を、ファイル名と行番号と一緒に表示
	int indent = fprintf(stderr, "%s:%d:", filename, line_num);
	fprintf(stderr, "%.*s\n", (int)(end - line), line);

	// エラー箇所を"^"で指し示して、エラーメッセージを表示
	int pos = loc - line;
	fprintf(stderr, "%*s", indent, ""); // pos個の空白を出力
	for (int i = 0;i < tab_num;i++)
		fprintf(stderr, "\t");
	fprintf(stderr, "%*s", pos-1, "");

	fprintf(stderr, "^ ");
	fprintf(stderr, fmt);
	fprintf(stderr, "\n");
	exit(1);
}

// 次のトークンが期待している記号のときには、トークンを1つ読み進める。
// それ以外の場合にはエラーを報告する。
void expect(char *op) {
	if (token->kind != TK_RESERVED || memcmp(token->str, op, strlen(op))) {
		char buf[100];
		sprintf(buf, "'%s' is expected, but %s", op, get_name(token->str, token->len));
		error_at(token->str, buf);
	}
	token = token->next;
}

// 次のトークンが数値の場合、トークンを1つ読み進めてその数値を返す。
// それ以外の場合にはエラーを報告する。
int expect_number() {
	if (token->kind != TK_NUM)
		error_at(token->str, "数ではありません");
	int val = token->val;
	token = token->next;
	return val;
}
