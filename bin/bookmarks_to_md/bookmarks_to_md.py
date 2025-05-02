#!/usr/bin/env python3

from __future__ import annotations
from html.parser import HTMLParser
from typing import Optional
import argparse


class BookmarkHTMLParser(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)

        self.data: list[str] = []
        self._level = 0
        self._latest_tag: Optional[str] = None
        self._latest_tag_attrs: Optional[list[tuple[str, str]]] = None

    def handle_starttag(self, tag: str, attrs: Optional[list[tuple[str, str]]]) -> None:
        self._latest_tag = tag
        self._latest_tag_attrs = attrs

        if tag == "dl":
            self._level += 1

    def handle_endtag(self, tag: str) -> None:
        if tag == "dl":
            self._level -= 1

    def handle_data(self, data: str) -> None:
        tag = self._latest_tag
        attrs = self._latest_tag_attrs

        if tag is None:
            return

        indent = "    " * self._level

        if tag in ["h1", "h3"]:
            # Treat folder titles as list items
            tmp = f"{indent}- {data.strip()}\n"
        elif tag == "a":
            href = ""
            for attr in attrs:
                if attr[0] == "href":
                    href = attr[1]
            tmp = f"{indent}- [{data.strip()}]({href})\n"
        else:
            tmp = None

        if tmp:
            self.data.append(tmp)

        self._latest_tag = None
        self._latest_tag_attrs = None

    def reset(self):
        super().reset()
        self.data = []
        self._level = 0
        self._latest_tag = None
        self._latest_tag_attrs = None


def _parse_args():
    parser = argparse.ArgumentParser(
        description="Convert HTML bookmarks to hierarchical Markdown list."
    )
    parser.add_argument("file", help="The HTML file containing the exported bookmarks")
    parser.add_argument(
        "--output",
        help="File to output Markdown to (defaults to STDOUT)",
        default="stdout",
    )
    return parser.parse_args()


def main():
    args = _parse_args()

    with open(args.file, "r") as f:
        html_content = f.read()

    parser = BookmarkHTMLParser()
    parser.feed(html_content)
    output = "".join(parser.data)

    if args.output.lower() == "stdout":
        print(output)
    else:
        with open(args.output, "w") as f:
            f.write(output)


if __name__ == "__main__":
    main()
