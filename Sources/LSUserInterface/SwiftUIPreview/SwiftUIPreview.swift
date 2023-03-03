//
//  SwiftUIPreview.swift
//  
//
//  Created by Алексей Филиппов on 13.02.2023.
//

// Apple
import SwiftUI

public struct SwiftUIPreview<Content: UIView>: UIViewRepresentable {
    // MARK: - Data
    private let content: () -> Content
    private let update: ((Content) -> Void)?
    
    // MARK: - Lfie cycle
    public init(content: @escaping () -> Content,
                update: ((Content) -> Void)? = nil) {
        self.content = content
        self.update = update
    }
    
    // MARK: - UIViewRepresentable
    public typealias UIViewType = Content
    public func makeUIView(context: Context) -> UIViewType {
        content()
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        update?(uiView)
    }
}

public struct SwiftUIStatePreview<Value, Content: UIView>: UIViewRepresentable {
    // MARK: - Data
    @State var value: Value
    private let content: (Binding<Value>) -> Content
    private let update: ((Content) -> Void)?
    
    // MARK: - Lfie cycle
    public init(_ value: Value,
                content: @escaping (Binding<Value>) -> Content,
                update: ((Content) -> Void)? = nil) {
        self._value = State(wrappedValue: value)
        self.content = content
        self.update = update
    }
    
    // MARK: - UIViewRepresentable
    public typealias UIViewType = Content
    public func makeUIView(context: Context) -> UIViewType {
        content($value)
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        update?(uiView)
    }
}
