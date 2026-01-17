import React from 'react';
import { Ruler, MessageCircle } from 'lucide-react';

export function FloatingButtons() {
  const buttonStyle: React.CSSProperties = {
    width: '50px',
    height: '120px',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    gap: '8px',
    textDecoration: 'none',
    transition: 'background-color 0.2s',
  };

  const textStyle: React.CSSProperties = {
    fontSize: '13px',
    fontWeight: 500,
    writingMode: 'vertical-rl',
    textOrientation: 'upright',
    letterSpacing: '2px',
  };

  return (
    <div
      style={{
        position: 'fixed',
        right: 0,
        top: '50%',
        transform: 'translateY(-50%)',
        zIndex: 9999,
        display: 'flex',
        flexDirection: 'column',
      }}
    >
      {/* 門市案例 */}
      <a
        href="#"
        style={{
          ...buttonStyle,
          backgroundColor: '#c9a961',
          color: 'white',
        }}
        onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = '#b89551')}
        onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = '#c9a961')}
      >
        <span style={textStyle}>門市案例</span>
      </a>

      {/* 到府丈量 */}
      <a
        href="#"
        style={{
          ...buttonStyle,
          backgroundColor: '#5a5a5a',
          color: 'white',
        }}
        onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = '#4a4a4a')}
        onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = '#5a5a5a')}
      >
        <Ruler style={{ width: '20px', height: '20px' }} />
        <span style={textStyle}>到府丈量</span>
      </a>

      {/* 線上諮詢 */}
      <a
        href="#"
        style={{
          ...buttonStyle,
          backgroundColor: '#5a5a5a',
          color: 'white',
        }}
        onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = '#4a4a4a')}
        onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = '#5a5a5a')}
      >
        <MessageCircle style={{ width: '20px', height: '20px' }} />
        <span style={textStyle}>線上諮詢</span>
      </a>
    </div>
  );
}
