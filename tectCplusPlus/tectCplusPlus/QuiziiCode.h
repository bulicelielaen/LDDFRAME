#pragma once

class QuiziiCode
{
public:
	QuiziiCode();
	~QuiziiCode();

public:
	void initQuiziiCode();
	void decodeBuffer(unsigned char buf[], unsigned int len);
	void encodeBuffer(unsigned char buf[], unsigned int len);
	void decodeBuffer(unsigned short buf[], unsigned int len);
	void encodeBuffer(unsigned short buf[], unsigned int len);

protected:
	void encodeDict();
	unsigned char checkDict(unsigned int index);
	unsigned char encodeChar(unsigned char ch, unsigned int index);
	unsigned short encodeShort(unsigned short sh, unsigned int index);

private:
	unsigned char m_charDict[2560];

};

